import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/core/routers/app_router.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/photon_adress/presentation/logic/photon_adress_cubit.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KycDocCubit>(create: (context) => KycDocCubit()),
        BlocProvider<PhotonAdressCubit>(
          create: (context) => getIt<PhotonAdressCubit>(),
        ),
      ],
      child: ToastificationWrapper(
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: AppRouter.router,
            builder: EasyLoading.init(),
          ),
        ),
      ),
    );
  }
}
