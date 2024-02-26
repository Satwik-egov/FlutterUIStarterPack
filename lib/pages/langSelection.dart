import 'package:auto_route/auto_route.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import '../blocs/localization.dart';
import '../routes/routes.dart';

class SelectLanguageScreen extends StatelessWidget {
  String? localeKey;

  SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppInitialization()..add(InitEvent.onLaunch()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AppInitialization, InitState>(
            builder: (context, appConfigState) => appConfigState.maybeWhen(
                uninitialized: () => CircularProgressIndicator(),
                orElse: () => Text('error Initializing'),
                initialized: (appConfig, serviceRegList) {
                  final languages =
                      appConfig.appConfig!.appConfig?[0].languages;

                  final initialModuleList =
                      appConfig.appConfig!.appConfig?[0].backendInterface;

                  const defaultLocale = 'en_MZ';
                  // localeKey = 'en_MZ';
                  return BlocProvider(
                    create: (context) => Localization()
                      ..add(LocalizationEvent.onSelect(
                          locale: defaultLocale,
                          moduleList: initialModuleList)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocBuilder<Localization, LocalizationState>(
                          builder: (context, locState) {
                            return DigitLanguageCard(
                              digitRowCardItems: languages!.map((e) {
                                return DigitRowCardModel(
                                    label: e.label,
                                    value: e.value,
                                    isSelected: e.value ==
                                        context.read<Localization>().locale);
                              }).toList(),
                              onLanguageChange: (rowCardValue) {
                                // localeKey = rowCardValue.value;
                                context.read<Localization>().add(
                                    LocalizationEvent.onSelect(
                                        locale: rowCardValue.value,
                                        moduleList: appConfig.appConfig!
                                            .appConfig?[0].backendInterface));
                              },
                              onLanguageSubmit: () {
                                context.navigateTo(LoginRoute());
                              },
                              languageSubmitLabel: 'Submit',
                            );
                          },
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
