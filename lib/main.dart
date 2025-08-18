import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:push_kyc/App/core/config/injection.dart';
import 'package:push_kyc/App/core/routers/app_router.dart';
import 'package:push_kyc/App/core/themes/app_theme.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_cubit.dart';
import 'package:toastification/toastification.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KycDocCubit>(create: (context) => KycDocCubit()),
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
