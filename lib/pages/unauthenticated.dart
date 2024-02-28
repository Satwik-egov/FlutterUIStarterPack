import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_init.dart';
import '../blocs/localization.dart';

class UnauthenticatedScreenWrapper extends StatelessWidget {
  const UnauthenticatedScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AppInitialization, InitState>(
          builder: (context, appConfigState) => appConfigState.maybeWhen(
              uninitialized: () => const CircularProgressIndicator(),
              orElse: () => const Text('error Initializing'),
              initialized: (appConfig, serviceRegList) {
                final initialModuleList =
                    appConfig.appConfig!.appConfig?[0].backendInterface;

                const defaultLocale = 'en_MZ';
                // localeKey = 'en_MZ';
                return BlocProvider(
                    create: (context) => Localization()
                      ..add(LocalizationEvent.onSelect(
                          locale: defaultLocale,
                          moduleList: initialModuleList)),
                    child: AutoRouter());
              }));
}
