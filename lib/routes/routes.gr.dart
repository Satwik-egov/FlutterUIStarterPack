// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          locale: args.locale,
        ),
      );
    },
    SelectLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguageRouteArgs>(
          orElse: () => const SelectLanguageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SelectLanguageScreen(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/home-screen',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-screen',
        ),
        RouteConfig(
          SelectLanguageRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required String? locale,
  }) : super(
          LoginRoute.name,
          path: '/login-screen',
          args: LoginRouteArgs(
            key: key,
            locale: locale,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.locale,
  });

  final Key? key;

  final String? locale;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, locale: $locale}';
  }
}

/// generated route for
/// [SelectLanguageScreen]
class SelectLanguageRoute extends PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({Key? key})
      : super(
          SelectLanguageRoute.name,
          path: '/',
          args: SelectLanguageRouteArgs(key: key),
        );

  static const String name = 'SelectLanguageRoute';
}

class SelectLanguageRouteArgs {
  const SelectLanguageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SelectLanguageRouteArgs{key: $key}';
  }
}
