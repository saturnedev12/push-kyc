import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/App/features/adress_location/presentation/pages/adress_location_page.dart';
import 'package:push_kyc/App/features/personnal_information/presentation/components/ci_phone_number.dart';
import 'package:push_kyc/App/features/personnal_information/presentation/components/email_text_field.dart';
import 'package:push_kyc/App/features/personnal_information/presentation/components/first_name_text_field.dart';
import 'package:push_kyc/App/features/personnal_information/presentation/components/gender_selector.dart';
import 'package:push_kyc/App/features/personnal_information/presentation/components/last_name_text_field.dart';
import 'package:push_kyc/App/features/personnal_information/presentation/components/nationnality_country_selector.dart';

class PersonnalInformationPage extends StatefulWidget {
  const PersonnalInformationPage({super.key});
  static String name = 'PERSONNAL_INFORMATIONS_PAGE';
  @override
  State<PersonnalInformationPage> createState() =>
      _PersonnalInformationPageState();
}

class _PersonnalInformationPageState extends State<PersonnalInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

        slivers: [
          SliverAppBar(
            title: Text('Informations personnels'),
            pinned: true,
            centerTitle: false,
          ),
          GenderSelector(),
          SliverGap(15),
          NationnalityCountrySelector(),
          SliverGap(15),
          FirstNameTextField(),
          SliverGap(15),
          LastNameTextField(),
          SliverGap(15),
          EmailTextField(),
          SliverGap(15),
          CiPhoneTextField(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(bottom: 18),
        height: 80,
        child: BlocSelector<KycDocCubit, KycDocState, bool>(
          selector:
              (s) =>
                  s.firstName != null &&
                  s.lastName != null &&
                  s.nationalityCountryCode != null &&
                  s.sexe != null &&
                  s.phoneNumber != null,
          builder: (context, ok) {
            return ElevatedButton(
              onPressed:
                  ok
                      ? () {
                        log('Continuer');
                        context.pushNamed(AdressLocationPage.name);
                      }
                      : null,
              child: const Text('Continuer'),
            );
          },
        ),
      ),
    );
  }
}
