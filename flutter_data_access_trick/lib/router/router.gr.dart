// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    FirstRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FirstPage(),
      );
    },
    SecondRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SecondPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          FirstRoute.name,
          path: '/',
        ),
        RouteConfig(
          SecondRoute.name,
          path: '/second',
        ),
      ];
}

/// generated route for
/// [FirstPage]
class FirstRoute extends PageRouteInfo<void> {
  const FirstRoute()
      : super(
          FirstRoute.name,
          path: '/',
        );

  static const String name = 'FirstRoute';
}

/// generated route for
/// [SecondPage]
class SecondRoute extends PageRouteInfo<void> {
  const SecondRoute()
      : super(
          SecondRoute.name,
          path: '/second',
        );

  static const String name = 'SecondRoute';
}
