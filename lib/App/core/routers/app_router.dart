import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/services/navigation_service.dart';
import 'package:push_kyc/app/features/adress_location/presentation/pages/adress_location_page.dart';
import 'package:push_kyc/app/features/birthdate_page/presentation/birthdate_page.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/take_id_camera.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/take_passeport_page.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/takle_id_card_page.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/type_documents_page.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/take_id_camera_options.dart';
import 'package:push_kyc/app/features/home/presentation/pages/home_page.dart';
import 'package:push_kyc/app/features/home/presentation/pages/loading_screen.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/pages/personnal_information_page.dart';
import 'package:push_kyc/app/features/photon_adress/presentation/pages/photon_adreess_picker_page.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/selfie_camera.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/take_selfie_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: '/loading',
    redirect: (context, state) => null,
    routes: [
      GoRoute(
        path: '/loading',
        name: LoadingScreen.name,
        builder: (BuildContext context, GoRouterState state) {
          return const LoadingScreen(); // const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/home_page',
        name: HomePage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage(); // const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/personnal_informations',
        name: PersonnalInformationPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const PersonnalInformationPage(); // const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/photon_location',
        name: PhotonAddressPickerPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const PhotonAddressPickerPage(); // const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/address_location',
        name: AdressLocationPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const AdressLocationPage(); // const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/birthdate_screen',
        name: BirthdatePage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const BirthdatePage(); // const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/take_selfie',
        name: TakeSelfiePage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const TakeSelfiePage(); // const OnboardingPage();
        },
        routes: [
          GoRoute(
            path: '/selfie_screen',
            name: SelfieCamera.name,
            builder: (BuildContext context, GoRouterState state) {
              return const SelfieCamera(); // const OnboardingPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/documents',
        name: TypeDocumentsPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const TypeDocumentsPage(); // const OnboardingPage();
        },
        routes: [
          GoRoute(
            path: '/take_id_card',
            name: TakleIdCardPage.name,
            builder: (BuildContext context, GoRouterState state) {
              return const TakleIdCardPage(); // const OnboardingPage();
            },
          ),
          GoRoute(
            path: '/take_passport',
            name: TakePasseportPage.name,
            builder: (BuildContext context, GoRouterState state) {
              return const TakePasseportPage(); // const OnboardingPage();
            },
          ),
          GoRoute(
            path: '/take_id_camera',
            name: TakeIdCamera.name,
            builder: (BuildContext context, GoRouterState state) {
              return TakeIdCamera(
                takeIdCameraOptions: state.extra as TakeIdCameraOptions,
              ); // const OnboardingPage();
            },
          ),
        ],
      ),
    ],
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('404: Page not found'))),
  );
}
