import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/authbloc.dart';

import '../blocs/app_init.dart';
import '../blocs/userbloc.dart';

class AuthenticatedScreenWrapper extends StatelessWidget {
  const AuthenticatedScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              AppInitialization()..add(const InitEvent.onLaunch()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        // BlocProvider(
        //   create: (context) => UserBloc(),
        // )
      ], child: AutoRouter());
}
