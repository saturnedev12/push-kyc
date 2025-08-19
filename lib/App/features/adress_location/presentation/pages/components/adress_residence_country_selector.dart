import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:push_kyc/App/core/extension/context_extension.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/App/core/themes/app_theme.dart';
import 'package:country_flags/country_flags.dart';

class AdressResidenceCountrySelector extends StatelessWidget {
  const AdressResidenceCountrySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (prev, curr) =>
              prev.residenceCountryCode != curr.residenceCountryCode,
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: ListTile(
              onTap: () {
                showCountryPicker(
                  context: context,
                  countryListTheme: CountryListThemeData(
                    flagSize: 25,
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                    bottomSheetHeight:
                        MediaQuery.of(context).size.height *
                        0.9, // Optional. Country list modal height
                    //Optional. Sets the border radius for the bottomsheet.
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    //Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  onSelect: (Country country) {
                    context.read<KycDocCubit>().setResidenceCountryCode(
                      country.countryCode,
                    );
                    print('Select country: ${country.displayName}');
                  },
                );
              },
              leading:
                  (state.residenceCountryCode == null)
                      ? FaIcon(
                        FontAwesomeIcons.earthAfrica,
                        color:
                            (state.residenceCountryCode != null)
                                ? AppTheme.kPrimaryDark
                                : Colors.grey.shade700,
                      )
                      : CountryFlag.fromCountryCode(
                        state.residenceCountryCode!,
                        shape: const RoundedRectangle(5),
                        width: 40,
                        height: 30,
                      ),

              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 15,
              ),
              title: Text(
                (state.residenceCountryCode != null)
                    ? CountryParser.parseCountryCode(
                      state.residenceCountryCode!,
                    ).name
                    : 'Pays de résidence',
              ),
              titleTextStyle: context.textTheme.bodyLarge!.copyWith(
                color:
                    (state.residenceCountryCode != null)
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
            ),
          ),
        );
      },
    );
  }
}
