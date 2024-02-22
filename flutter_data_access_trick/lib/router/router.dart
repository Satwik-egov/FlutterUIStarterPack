import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_data_access_trick/pages/firstpage.dart';
import 'package:flutter_data_access_trick/pages/secondpage.dart';

part 'router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: FirstPage, initial: true, path: '/'),
  AutoRoute(page: SecondPage, path: '/second')
])
class AppRouter extends _$AppRouter {}
