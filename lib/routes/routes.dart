import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_digit_app/pages/languageSelection.dart';
import 'package:new_digit_app/pages/loginpage.dart';

import '../pages/home.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: HomeScreen),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: SelectLanguageScreen, initial: true)
])
class AppRouter extends _$AppRouter {}
