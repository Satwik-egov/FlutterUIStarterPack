import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_digit_app/pages/languageSelection.dart';
import 'package:new_digit_app/pages/loginpage.dart';

import '../pages/home.dart';
import '../pages/langSelection.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: HomeScreen),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: SelectLanguageScreen, initial: true)
])
class AppRouter extends _$AppRouter {}

// @MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
//   AutoRoute(page: UnauthenicatedPageWrapper, path: '/', children: [
//     AutoRoute(page: LoginScreen),
//     AutoRoute(page: SelectLanguageScreen, initial: true)
//   ]),
//   AutoRoute(page: AuthenticatedPageWrapper, path: '/', children: [
//     AutoRoute(page: HomeScreen),
//   ])
// ])
// class AppRouter extends _$AppRouter {}
