import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/utils/constants.dart';
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider(
          create: (context) => AppInitialization()..add(InitEvent.onLaunch()),
          child: BlocBuilder<AppInitialization, InitState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => Text('error Initializing'),
              initialized: (appConfig, serviceRegistryModel) =>
                  MaterialApp.router(
                scaffoldMessengerKey: scaffoldMessengerKey,
                theme: DigitTheme.instance.mobileTheme,
                routerDelegate: _approuter.delegate(),
                routeInformationParser: _approuter.defaultRouteParser(),
                localizationsDelegates: [
                  AppLocalizations.getDelegate(appConfig.appConfig!),
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
              ),
            ),
          )),
    );
  }
}
