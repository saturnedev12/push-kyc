// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/core/constants/constants.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/features/birthdate_page/presentation/birthdate_page.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/components/ci_phone_number.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/components/email_text_field.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/components/first_name_text_field.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/components/gender_selector.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/components/last_name_text_field.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/components/nationnality_country_selector.dart';

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
            final cubit = context.read<KycDocCubit>();

            return ElevatedButton(
              onPressed:
                  ok
                      ? () async {
                        cubit.setAlreadyStarted(true);
                        await getIt<KycDocLocalRepository>().save(cubit.state);
                        if (editMode) {
                          context.pop(true);
                        } else {
                          context.pushNamed(BirthdatePage.name);
                        }
                      }
                      : null,
              child: Text(editMode ? 'Terminer' : 'Continuer'),
            );
          },
        ),
      ),
    );
  }
}
