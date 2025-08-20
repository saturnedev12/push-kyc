// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/features/adress_location/presentation/pages/components/adress_location_selector.dart';
import 'package:push_kyc/app/features/adress_location/presentation/pages/components/adress_map.dart';
import 'package:push_kyc/app/features/adress_location/presentation/pages/components/adress_residence_country_selector.dart';
import 'package:push_kyc/app/features/adress_location/presentation/pages/components/postal_code_field.dart';
import 'package:push_kyc/app/features/birthdate_page/presentation/birthdate_page.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/type_documents_page.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';

class AdressLocationPage extends StatefulWidget {
  const AdressLocationPage({super.key});
  static String name = 'ADDRESS_LOCATION_PAGE';
  @override
  State<AdressLocationPage> createState() => _AdressLocationPageState();
}

class _AdressLocationPageState extends State<AdressLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: const CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            title: Text('Votre adresse'),
            pinned: true,
            centerTitle: false,
          ),
          AdressResidenceCountrySelector(),
          SliverGap(15),
          AdressLocationSelector(),
          SliverGap(15),
          PostalCodeField(),
          SliverGap(15),
          AdressMap(height: 300),
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
                  s.addressName != null &&
                  s.addressLat != null &&
                  s.addressLon != null &&
                  s.postalCode != null &&
                  s.residenceCountryCode != null,
          builder: (context, ok) {
            final cubit = context.read<KycDocCubit>();
            bool alreadyStarted = cubit.state.alreadyStarted;

            return ElevatedButton(
              onPressed:
                  ok
                      ? () async {
                        await getIt<KycDocLocalRepository>().save(cubit.state);
                        if (alreadyStarted) {
                          context.pop(true);
                        } else {
                          context.pushNamed(TypeDocumentsPage.name);
                        }
                      }
                      : null,
              child: Text(alreadyStarted ? 'Terminer' : 'Continuer'),
            );
          },
        ),
      ),
    );
  }
}
