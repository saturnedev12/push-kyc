import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/photon_adress/presentation/pages/photon_adreess_picker_page.dart';

class AdressLocationSelector extends StatelessWidget {
  const AdressLocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (prev, curr) =>
              prev.addressName != curr.addressName ||
              prev.addressLat != curr.addressLat ||
              prev.addressLon != curr.addressLon,
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.mapPin,
                color:
                    (state.addressName != null)
                        ? AppTheme.kPrimaryDark
                        : Colors.grey.shade700,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 15,
              ),
              title: Text(state.addressName ?? 'Adresse localisation'),
              titleTextStyle: context.textTheme.bodyLarge!.copyWith(
                color:
                    (state.addressName != null)
                        ? AppTheme.kPrimaryDark
                        : Colors.grey,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.grey.shade400),
              ),

              trailing: const FaIcon(
                FontAwesomeIcons.pen,
                size: 20,
                color: AppTheme.kPrimaryDark,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  builder:
                      (context) => FractionallySizedBox(
                        heightFactor: 0.85,

                        child: PhotonAddressPickerPage(
                          onSelected: (feature) {
                            final p = feature.properties;

                            // Construit un libellé lisible
                            final nameParts =
                                <String?>[p.name, p.city, p.state, p.country]
                                    .where(
                                      (s) => s != null && s.trim().isNotEmpty,
                                    )
                                    .cast<String>()
                                    .toList();
                            final name =
                                nameParts.isNotEmpty
                                    ? nameParts.join(', ')
                                    : (p.name ?? 'Adresse');

                            // Coords Photon: [lon, lat]
                            final coords = feature.geometry.coordinates;
                            final lon = coords.isNotEmpty ? coords[0] : 0.0;
                            final lat = coords.length > 1 ? coords[1] : 0.0;

                            final cubit = context.read<KycDocCubit>();

                            // 1) Set adresse + coords
                            cubit.setAddress(name: name, lon: lon, lat: lat);

                            // 2) (Optionnel) Set codes pays depuis Photon
                            final cc = (p.countrycode ?? '').toUpperCase();
                            if (cc.isNotEmpty) {
                              cubit.setResidenceCountryCode(cc);
                              // si aucune nationalité encore définie, on la met par défaut = résidence
                              if (cubit.state.nationalityCountryCode == null ||
                                  cubit.state.nationalityCountryCode!.isEmpty) {
                                cubit.setNationalityCountryCode(cc);
                              }
                            }

                            // (Optionnel) ferme la page si c'est un picker
                            context.pop();
                          },
                        ),
                      ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
