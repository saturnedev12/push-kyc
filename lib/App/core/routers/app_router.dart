import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/App/core/services/navigation_service.dart';
import 'package:push_kyc/App/features/birthdate_page/presentation/birthdate_page.dart';
import 'package:push_kyc/App/features/documents/presentation/pages/take_id_camera.dart';
import 'package:push_kyc/App/features/documents/presentation/pages/take_passeport_page.dart';
import 'package:push_kyc/App/features/documents/presentation/pages/takle_id_card_page.dart';
import 'package:push_kyc/App/features/documents/presentation/pages/type_documents_page.dart';
import 'package:push_kyc/App/features/documents/presentation/utils/take_id_camera_options.dart';
import 'package:push_kyc/App/features/photon_adress/presentation/pages/photon_adreess_picker_page.dart';
import 'package:push_kyc/App/features/selfie/presentaion/pages/selfie_camera.dart';
import 'package:push_kyc/App/features/selfie/presentaion/pages/take_selfie_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: '/photon_location',
    redirect: (context, state) => null,
    routes: [
      GoRoute(
        path: '/photon_location',
        name: PhotonAddressPickerPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const PhotonAddressPickerPage(); // const OnboardingPage();
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
