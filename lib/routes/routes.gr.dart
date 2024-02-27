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
    UnauthenticatedRouteWrapper.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedScreenWrapper(),
      );
    },
    AuthenticatedRouteWrapper.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthenticatedScreenWrapper(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          appLocalizations: args.appLocalizations,
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
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          UnauthenticatedRouteWrapper.name,
          path: '/',
          children: [
            RouteConfig(
              LoginRoute.name,
              path: 'login-screen',
              parent: UnauthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              SelectLanguageRoute.name,
              path: '',
              parent: UnauthenticatedRouteWrapper.name,
            ),
          ],
        ),
        RouteConfig(
          AuthenticatedRouteWrapper.name,
          path: '/',
          children: [
            RouteConfig(
              HomeRoute.name,
              path: 'home-screen',
              parent: AuthenticatedRouteWrapper.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [UnauthenticatedScreenWrapper]
class UnauthenticatedRouteWrapper extends PageRouteInfo<void> {
  const UnauthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouteWrapper.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouteWrapper';
}

/// generated route for
/// [AuthenticatedScreenWrapper]
class AuthenticatedRouteWrapper extends PageRouteInfo<void> {
  const AuthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouteWrapper.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouteWrapper';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          LoginRoute.name,
          path: 'login-screen',
          args: LoginRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [SelectLanguageScreen]
class SelectLanguageRoute extends PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({Key? key})
      : super(
          SelectLanguageRoute.name,
          path: '',
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

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-screen',
        );

  static const String name = 'HomeRoute';
}
