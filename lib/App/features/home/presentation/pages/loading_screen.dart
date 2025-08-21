// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:push_kyc/App/core/themes/app_theme.dart';
import 'package:push_kyc/App/features/home/presentation/pages/home_page.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/core/routers/app_router.dart';
import 'package:push_kyc/app/core/services/connectivity_service.dart';
import 'package:push_kyc/app/features/authentification/presentation/pages/login_page.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static String name = 'LOADING_SCREEN';
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    ConnectinityService.listen();
    () async {
      final hasCreds = await getIt<KycDocLocalRepository>().hasCredentials();
      final kycDocState = await getIt<KycDocLocalRepository>().load();
      if (kycDocState != null) {
        context.read<KycDocCubit>().loadFromLocal(kycDocState);
      }
      log(hasCreds.toString(), name: 'HasCreds');
      if (hasCreds) {
        AppRouter.router.goNamed(HomePage.name);
      } else {
        AppRouter.router.goNamed(LoginPage.name);
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverGap(200),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/logo.png',
                width: 30,
                height: 100,
              ),
            ),
          ),
          const SliverGap(100),
          const SliverToBoxAdapter(
            child: CupertinoActivityIndicator(
              radius: 40,
              color: AppTheme.kPrimary,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     getIt<KycDocLocalRepository>().load().then((value) {
      //       log(value.toString());
      //       AppRouter.router.goNamed(HomePage.name);
      //     });
      //   },
      // ),
    );
  }
}

// /// Recharge le state depuis Isar (si un enregistrement existe)
// Future<void> loadFromLocal(BuildContext context) async {
//   final isar = getIt<IsarConfig>().instance;
//   final local = await isar.writeTxn(() async {
//     await isar.kycDocLocals.get(1);
//   });
//   if (local == null) return;
//   context.read<KycDocCubit>().loadFromLocal(
//     KycDocState(
//       alreadyStarted: local.alreadyStarted,
//       validationOk: local.validationOk,
//       typeChoisi:
//           (local.typeChoisi != null)
//               ? TypeId.values.byName(local.typeChoisi!)
//               : null,
//       pathRecto: local.pathRecto,
//       pathVerso: local.pathVerso,
//       pathPassport: local.pathPassport,
//       pathSelfie: local.pathSelfie,
//       birthYear: local.birthYear,
//       birthMonth: local.birthMonth,
//       birthDay: local.birthDay,
//       addressName: local.addressName,
//       addressLon: local.addressLon,
//       addressLat: local.addressLat,
//       residenceCountryCode: local.residenceCountryCode,
//       postalCode: local.postalCode,
//       firstName: local.firstName,
//       lastName: local.lastName,
//       email: local.email,
//       phoneNumber: local.phoneNumber,
//       sexe: (local.sexe != null) ? Sexe.values.byName(local.sexe!) : null,
//       nationalityCountryCode: local.nationalityCountryCode,
//     ),
//   );
// }
