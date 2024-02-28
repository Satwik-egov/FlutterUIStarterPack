import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/utils/constants.dart';
import 'package:new_digit_app/utils/envConfig.dart';
import 'package:attendance_management/blocs/app_localization.dart'
    as attendance_localization;
import 'blocs/authbloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AppInitialization()..add(const InitEvent.onLaunch()),
            ),
            BlocProvider(
              create: (context) => AuthBloc(),
            )
          ],
          child: BlocBuilder<AppInitialization, InitState>(
            builder: (context, state) => state.maybeWhen(
                orElse: () => const Text('error Initializing'),
                initialized: (appConfig, serviceRegistryModel) {
                  final initialModuleList =
                      appConfig.appConfig!.appConfig?[0].backendInterface;
                  const defaultLocale = 'en_MZ';
                  return BlocProvider(
                      create: (context) => Localization()
                        ..add(LocalizationEvent.onSelect(
                            locale: defaultLocale,
                            moduleList: initialModuleList)),
                      child: MaterialApp.router(
                        scaffoldMessengerKey: scaffoldMessengerKey,
                        theme: DigitTheme.instance.mobileTheme,
                        routerDelegate: _approuter.delegate(),
                        routeInformationParser: _approuter.defaultRouteParser(),
                        localizationsDelegates: [
                          AppLocalizations.getDelegate(appConfig.appConfig!),
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          // attendance_localization.AttendanceLocalization
                          //     .getDelegate(
                          //   getLocalizationString(
                          //     widget.isar,
                          //     selectedLocale,
                          //   ),
                          //   appConfig.languages!,
                          // )
                        ],
                      ));
                }),
          )),
    );
  }
}

// getLocalizationString(Isar isar, String selectedLocale) async {
//   List<dynamic> localizationValues = [];

//   final List<LocalizationWrapper> localizationList =
//       await isar.localizationWrappers
//           .filter()
//           .localeEqualTo(
//             selectedLocale.toString(),
//           )
//           .findAll();
//   if (localizationList.isNotEmpty) {
//     localizationValues.addAll(localizationList.first.localization!);
//   }

//   return localizationValues;
// }