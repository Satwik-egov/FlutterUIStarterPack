import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/utils/envConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final AppInitialization appinit = AppInitialization();

  // final Localization loc = Localization();
  // appinit.add(InitEvent.onLaunch());
  await envConfig.initialize();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _approuter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: DigitTheme.instance.mobileTheme,
      routerDelegate: _approuter.delegate(),
      routeInformationParser: _approuter.defaultRouteParser(),
    );
  }
}
