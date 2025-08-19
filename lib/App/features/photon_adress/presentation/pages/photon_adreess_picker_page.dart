// lib/App/features/photon_adress/ui/photon_address_picker_page.dart
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // pour ListTile/shimmer container round
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:push_kyc/App/core/config/injection.dart';
import 'package:push_kyc/App/core/themes/app_theme.dart';
import 'package:shimmer/shimmer.dart';

import 'package:push_kyc/App/features/photon_adress/data/models/photon_adress_model.dart';
import 'package:push_kyc/App/features/photon_adress/domain/usecases/photon_address_usecases.dart';

class PhotonAddressPickerPage extends StatefulWidget {
  static String name = 'PHOTON_ADRESS';
  const PhotonAddressPickerPage({
    super.key,
    this.onSelected,
    this.lang = 'fr',
    this.layers = const [
      'house',
      'street',
      'locality',
      'city',
      'district',
      'state',
      'country',
    ],
    this.pageSize = 20,
    this.hintText = "Rechercher une adresse, ville…",
    this.title = "Sélection d'adresse",
  });

  final void Function(PhotonAdressModel feature)? onSelected;
  final String lang;
  final List<String> layers;
  final int pageSize;
  final String hintText;
  final String title;

  @override
  State<PhotonAddressPickerPage> createState() =>
      _PhotonAddressPickerPageState();
}

class _PhotonAddressPickerPageState extends State<PhotonAddressPickerPage> {
  final usecases = getIt<PhotonAddressUsecases>();
  final _searchController = TextEditingController();
  final _pagingController = PagingController<int, PhotonAdressModel>(
    firstPageKey: 1,
  );

  Timer? _debounce;
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_loadPage);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  void _onQueryChanged(String q) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      _currentQuery = q.trim();
      _pagingController.refresh();
    });
  }

  Future<void> _loadPage(int pageKey) async {
    try {
      if (_currentQuery.isEmpty) {
        // Rien à chercher → liste vide
        _pagingController.appendLastPage(const []);
        return;
      }

      final pageSize = widget.pageSize;

      // Ton usecase renvoie TOUTES les entrées cumulées (page -> limit cumulatif côté repo)
      final cumulative = await usecases.getList(
        query: _currentQuery,
        page: pageKey,
        pageSize: pageSize,
        lang: widget.lang,
        layers: widget.layers,
      );

      // On isole seulement la tranche de la page demandée
      final start = (pageKey - 1) * pageSize;
      final end = cumulative.length;
      final newItems =
          start < end ? cumulative.sublist(start) : <PhotonAdressModel>[];

      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: CupertinoSearchTextField(
              autofocus: true,
              controller: _searchController,
              placeholder: widget.hintText,
              onChanged: _onQueryChanged,
              autocorrect: false,
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
                icon: const Icon(FontAwesomeIcons.solidCircleXmark),
              ),
            ],
          ),

          const SliverGap(10),
          PagedSliverList<int, PhotonAdressModel>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<PhotonAdressModel>(
              itemBuilder:
                  (context, item, index) => _AddressTile(
                    item: item,
                    onTap: () => widget.onSelected?.call(item),
                  ),
              firstPageProgressIndicatorBuilder: (_) => const _ShimmerList(),
              newPageProgressIndicatorBuilder: (_) => const _ShimmerNextPage(),
              noItemsFoundIndicatorBuilder: (_) => const _EmptyState(),
              firstPageErrorIndicatorBuilder:
                  (ctx) => _ErrorState(
                    message: _errorText(_pagingController.error),
                    onRetry: () => _pagingController.refresh(),
                  ),
              newPageErrorIndicatorBuilder:
                  (ctx) => _ErrorState(
                    message: _errorText(_pagingController.error),
                    onRetry: () => _pagingController.retryLastFailedRequest(),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  String _errorText(Object? err) {
    final txt = err?.toString() ?? 'Erreur inconnue';
    if (txt.contains('SocketException')) return 'Vérifie ta connexion Internet';
    return txt;
  }
}

class _AddressTile extends StatelessWidget {
  const _AddressTile({required this.item, this.onTap});
  final PhotonAdressModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final p = item.properties;
    final titleParts =
        <String?>[p.name, p.city].where((e) => (e ?? '').isNotEmpty).toList();

    final subtitleParts =
        <String?>[
          p.state,
          p.country,
          p.countrycode?.toUpperCase(),
        ].where((e) => (e ?? '').isNotEmpty).toList();

    // coords: [lon, lat]
    final lon =
        item.geometry.coordinates.isNotEmpty ? item.geometry.coordinates[0] : 0;
    final lat =
        item.geometry.coordinates.length > 1 ? item.geometry.coordinates[1] : 0;

    return CupertinoListTile(
      leading: const Icon(
        CupertinoIcons.location_solid,
        color: AppTheme.kAccent,
      ),
      title: Text(
        titleParts.isEmpty ? (p.name ?? 'Adresse') : titleParts.join(' · '),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        [
          if (subtitleParts.isNotEmpty) subtitleParts.join(', '),
          '${lat.toStringAsFixed(5)}, ${lon.toStringAsFixed(5)}',
        ].where((e) => e.isNotEmpty).join('\n'),
        style: const TextStyle(
          fontSize: 13,
          color: CupertinoColors.inactiveGray,
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_right,
        color: AppTheme.kPrimaryDark,
      ),
      onTap: onTap,
    );
  }
}

/// Petit clone iOS d’un tile Material
class CupertinoListTile extends StatelessWidget {
  const CupertinoListTile({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      // pour le ripple discret, reste visuel Cupertino
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle.merge(
                      style: const TextStyle(color: AppTheme.kPrimaryDark),
                      child: title,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: CupertinoColors.systemGrey,
                        ),
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}

class _ShimmerList extends StatelessWidget {
  const _ShimmerList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (_, __) => _ShimmerTile(),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: 20,
      ),
    );
  }
}

class _ShimmerNextPage extends StatelessWidget {
  const _ShimmerNextPage();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12), child: _ShimmerTile());
  }
}

class _ShimmerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CupertinoColors.tertiarySystemFill,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(height: 12, width: 180, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(width: 10, height: 14, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.search, size: 48, color: AppTheme.kAccent),
            SizedBox(height: 12),
            Text(
              "Tape une recherche pour commencer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.label,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Les résultats peuvent prendre quelques secondes : "
              "j'utilise Photon (API open source), parfois plus lent ou limité.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.kAccent,
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: CupertinoColors.destructiveRed),
          ),
          const SizedBox(height: 8),
          CupertinoButton.filled(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onPressed: onRetry,
            child: const Text('Réessayer'),
          ),
        ],
      ),
    );
  }
}
