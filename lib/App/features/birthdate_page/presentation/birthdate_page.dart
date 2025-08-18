import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/App/core/themes/app_theme.dart';

class BirthdatePage extends StatefulWidget {
  const BirthdatePage({super.key});
  static String name = 'BIRTHDATE_PAGE';

  @override
  State<BirthdatePage> createState() => _BirthdatePageState();
}

class _BirthdatePageState extends State<BirthdatePage> {
  late final TextEditingController _day = TextEditingController();
  late final TextEditingController _month = TextEditingController();
  late final TextEditingController _year = TextEditingController();

  DateTime get _today => DateTime.now();
  DateTime get _defaultInitial {
    final eighteen = DateTime(_today.year - 18, _today.month, _today.day);
    return eighteen;
  }

  void _syncControllers(KycDocState s) {
    _day.text = (s.birthDay ?? '').toString();
    _month.text = (s.birthMonth ?? '').toString();
    _year.text = (s.birthYear ?? '').toString();
  }

  @override
  void dispose() {
    _day.dispose();
    _month.dispose();
    _year.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.kPrimary;
    final cardRadius = 20.0;

    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (p, n) =>
              p.birthYear != n.birthYear ||
              p.birthMonth != n.birthMonth ||
              p.birthDay != n.birthDay,
      builder: (context, state) {
        _syncControllers(state);

        final selected = state.birthDate ?? _defaultInitial;
        final firstDate = DateTime(1900, 1, 1);
        final lastDate = _today;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('Date de naissance'),
                  pinned: true,
                  centerTitle: false,
                ),
                SliverToBoxAdapter(child: _Header(selected: selected)),
                SliverGap(10),
                SliverToBoxAdapter(
                  child: _IosCard(
                    radius: cardRadius,
                    child: DatePickerTheme(
                      data: DatePickerThemeData(
                        backgroundColor: Colors.transparent,
                        headerForegroundColor: Colors.black87,
                        todayForegroundColor: WidgetStatePropertyAll(color),

                        rangeSelectionBackgroundColor: color.withOpacity(.12),

                        dayForegroundColor: WidgetStateProperty.resolveWith((
                          s,
                        ) {
                          if (s.contains(WidgetState.selected)) return color;
                          return Colors.black87;
                        }),
                        dayBackgroundColor: WidgetStateProperty.resolveWith((
                          s,
                        ) {
                          if (s.contains(WidgetState.selected)) return color;
                          return Colors.red;
                        }),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(cardRadius),
                        ),
                      ),
                      child: CalendarDatePicker(
                        initialDate: selected,
                        firstDate: firstDate,
                        lastDate: lastDate,
                        onDateChanged:
                            (d) => context.read<KycDocCubit>().setBirthDate(d),
                      ),
                    ),
                  ),
                ),
                SliverGap(10),
                SliverToBoxAdapter(
                  child: _IosCard(
                    radius: cardRadius,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        _Field(
                          label: 'Jour',
                          controller: _day,
                          max: 31,
                          width: 80,
                          onChanged:
                              (v) => context.read<KycDocCubit>().setBirthDay(
                                int.tryParse(v),
                              ),
                        ),
                        const SizedBox(width: 10),
                        _Field(
                          label: 'Mois',
                          controller: _month,
                          max: 12,
                          width: 80,
                          onChanged:
                              (v) => context.read<KycDocCubit>().setBirthMonth(
                                int.tryParse(v),
                              ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _Field(
                            label: 'Année',
                            controller: _year,
                            max: 2100,
                            onChanged:
                                (v) => context.read<KycDocCubit>().setBirthYear(
                                  int.tryParse(v),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGap(10),
                SliverGap(10),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ).copyWith(bottom: 15),
            height: 80,
            child: BlocSelector<KycDocCubit, KycDocState, bool>(
              selector: (s) => s.birthDate != null,
              builder: (context, ok) {
                return ElevatedButton(
                  onPressed:
                      ok
                          ? () {
                            context.pop(
                              context.read<KycDocCubit>().state.birthDate,
                            );
                          }
                          : null,
                  child: const Text('Continuer'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.selected});
  final DateTime selected;

  @override
  Widget build(BuildContext context) {
    final m = DateFormat.MMMM('fr_FR').format(selected);
    final y = DateFormat.y('fr_FR').format(selected);
    final d = DateFormat.d('fr_FR').format(selected);

    return Row(
      children: [
        Expanded(
          child: _IosCard(
            child: Row(
              children: [
                const SizedBox(width: 10),
                const Icon(FontAwesomeIcons.calendarDay, size: 18),
                const SizedBox(width: 10),
                Text(
                  '$d $m, $y',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        _IosCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            DateFormat.yMMMM('fr_FR').format(selected),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _IosCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  const _IosCard({
    required this.child,
    this.radius = 20,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int max;
  final double? width;
  final ValueChanged<String>? onChanged;

  const _Field({
    required this.label,
    required this.controller,
    required this.max,
    this.width,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final field = TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF2F2F7),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );

    if (width != null) {
      return SizedBox(width: width, child: field);
    }
    return field;
  }
}
