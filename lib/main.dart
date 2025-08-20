import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:push_kyc/app/app.dart';
import 'package:push_kyc/app/core/config/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await initializeDateFormatting('fr_FR', null);
  runApp(const App());
}
