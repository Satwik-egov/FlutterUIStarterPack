import 'package:auto_route/auto_route.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import '../blocs/localization.dart';
import '../routes/routes.dart';

class SelectLanguageScreen extends StatelessWidget {
  String? localeKey;

  SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: context.read<AppInitialization>().state.maybeWhen(
            orElse: () => const CircularProgressIndicator(),
            initialized: (appConfig, serviceRegList) {
              final languages = appConfig.appConfig!.appConfig?[0].languages;
              return BlocBuilder<Localization, LocalizationState>(
                builder: (context, locState) =>
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  DigitLanguageCard(
                    digitRowCardItems: languages!.map((e) {
                      return DigitRowCardModel(
                          label: e.label,
                          value: e.value,
                          isSelected:
                              e.value == context.read<Localization>().locale);
                      // e.value == locState.locale ?? );
                    }).toList(),
                    onLanguageChange: (rowCardValue) {
                      // localeKey = rowCardValue.value;
                      context.read<Localization>().add(
                          LocalizationEvent.onSelect(
                              locale: rowCardValue.value,
                              moduleList: appConfig
                                  .appConfig!.appConfig?[0].backendInterface));
                    },
                    onLanguageSubmit: () {
                      context.navigateTo(LoginRoute());
                    },
                    languageSubmitLabel: 'Submit',
                  ),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text(AppLocalizations.of(context).translate))
                ]),
              );
            }));
  }
}
