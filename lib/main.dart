import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/data/app_shared_preferences.dart';
import 'package:new_digit_app/data/nosql/localization.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/utils/constants.dart';
import 'package:new_digit_app/utils/envConfig.dart';
import 'package:attendance_management/blocs/app_localization.dart'
    as attendance_localization;
import 'blocs/authbloc.dart';

late Isar _isar; //new addition

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await envConfig.initialize();
  _isar = await Constants().isar; //new addition

  await AppSharedPreferences().init();
  if (AppSharedPreferences().isFirstLaunch) {
    AppLogger.instance.info('App Launched First Time', title: 'main');
    await AppSharedPreferences().appLaunchedFirstTime();
  }

  runApp(MainApp(
    isar: _isar,
  ));
}

class MainApp extends StatefulWidget {
  final Isar isar;
  const MainApp({super.key, required this.isar});

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
                // orElse: () => const Text('error Initializing'),
                orElse: () => const CircularProgressIndicator(),
                initialized: (appConfig, serviceRegistryModel) {
                  final initialModuleList =
                      appConfig.appConfig!.appConfig?[0].backendInterface;
                  const defaultLocale = 'en_MZ';
                  final languages =
                      appConfig.appConfig!.appConfig?[0].languages;
                  var firstLanguage;
                  firstLanguage = languages?.last.value;

                  final selectedLocale =
                      AppSharedPreferences().getSelectedLocale ?? firstLanguage;
                  return BlocProvider(
                      create: (context) => LocalizationBloc(widget.isar)
                        ..add(LocalizationEvent.onSelect(
                            locale: defaultLocale,
                            moduleList: initialModuleList)),
                      child: MaterialApp.router(
                        scaffoldMessengerKey: scaffoldMessengerKey,
                        theme: DigitTheme.instance.mobileTheme,
                        routerDelegate: _approuter.delegate(),
                        routeInformationParser: _approuter.defaultRouteParser(),
                        supportedLocales: languages != null
                            ? languages.map((e) {
                                final results = e.value.split('_');

                                return results.isNotEmpty
                                    ? Locale(results.first, results.last)
                                    : firstLanguage;
                              })
                            : [firstLanguage],
                        localizationsDelegates: [
                          AppLocalizations.getDelegate(
                              appConfig.appConfig!, widget.isar),
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          //new addition
                          attendance_localization.AttendanceLocalization
                              .getDelegate(
                            getLocalizationString(widget.isar, selectedLocale),
                            // "en_MZ"),
                            languages!,
                          )
                        ],
                        locale: languages != null
                            ? Locale(
                                selectedLocale!.split("_").first,
                                selectedLocale.split("_").last,
                              )
                            : firstLanguage,
                      ));
                }),
          )),
    );
  }
}

//new addition
getLocalizationString(Isar isar, String selectedLocale) async {
  List<dynamic> localizationValues = [];

  final List<LocalizationWrapper> localizationList =
      await isar.localizationWrappers
          .filter()
          .localeEqualTo(
            selectedLocale.toString(),
          )
          .findAll();
  if (localizationList.isNotEmpty) {
    localizationValues.addAll(localizationList.first.localization!);
  }

  return localizationValues;
}
