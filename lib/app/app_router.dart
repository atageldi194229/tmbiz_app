import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmbiz/navigation/navigation.dart';
import 'package:tmbiz/splash/splash.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: GoRouteNames.main,
  routes: [
    GoRoute(
      name: GoRouteNames.splash,
      path: GoRouteNames.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      name: GoRouteNames.main,
      path: GoRouteNames.main,
      builder: (context, state) {
        return const BottomNavBar();
      },
      routes: const [
        // GoRoute(
        //   name: GoRouteNames.places,
        //   path: GoRouteNames.places.replaceFirst('/', ''),
        //   builder: (context, state) {
        //     return const PlacesPage();
        //   },
        //   routes: [
        //     GoRoute(
        //       name: GoRouteNames.detailedPlace,
        //       path: GoRouteNames.detailedPlace.replaceFirst('/', ''),
        //       builder: (context, state) {
        //         final slug = state.extra as String;
        //         return DetailedPlacePage(slug: slug);
        //       },
        //     ),
        //   ],
        // ),
        // GoRoute(
        //   name: GoRouteNames.detailedPlace,
        //   path: GoRouteNames.detailedPlace.replaceFirst('/', ''),
        //   builder: (context, state) {
        //     return const DetailedPlacePage();
        //   },
        // ),
      ],
    ),
  ],
);

// final appRouterProvider = Provider<GoRouter>.value(value: appRouter);

abstract class GoRouteNames {
  static const String splash = '/splash';
  static const String main = '/';
  static const String places = '/places';
  static const String detailedPlace = '/detailed_place';
}

abstract mixin class AppRouterContext {
  BuildContext? get appContext => appRouter.routerDelegate.navigatorKey.currentContext;
}
