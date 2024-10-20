import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/index.dart';
import '../../features/not-found/index.dart';
import '../../shared/widgets/wolt_sheet/home/home_screen.dart';
import 'index.dart';

class AppRouter {
  // private navigators
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorAKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellA');
  static final shellNavigatorBKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellB');

  static GoRouter router = GoRouter(
    // Initial route
    initialLocation: RoutePaths.home,
    navigatorKey: rootNavigatorKey,
    observers: [AppRouteObserver(), FlutterSmartDialog.observer],

    // List of all routes
    routes: [
      if (kIsWeb)
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              DashboardShell(child: navigationShell),
          branches: [
            StatefulShellBranch(
              navigatorKey: shellNavigatorAKey,
              routes: [
                _homeRoute(true),
                _settingRoute(shell: true),
                _itemDetailsRoute(),
              ],
            ),
          ],
        ),
      if (!kIsWeb) ...[
        _homeRoute(false),
        _settingRoute(),
        _itemDetailsRoute(),
      ],
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => const SampleFeaturePage(),
      ),
      GoRoute(
        path: RoutePaths.commingSoon,
        name: RouteNames.commingSoon,
        builder: (context, state) =>
            CommingSoonPage(shell: state.uri.queryParameters['shell'] == '1'),
      ),

      // Example of dynamic route with user ID
      // GoRoute(
      //   path: RoutePaths.profile,
      //   name: RouteNames.profile,
      //   builder: (context, state) {
      //     return const SampleFeaturePage();
      //   },
      // ),
    ],

    // Route guards & redirect logic
    redirect: (context, state) {
      const bool isAuthenticated = true;
      final loggingIn = state.path == RoutePaths.login;

      if (!isAuthenticated && !loggingIn) {
        return RoutePaths.login;
      }

      // Example: if user is logged in and tries to access login, redirect to home
      if (isAuthenticated && loggingIn) {
        return RoutePaths.home;
      }

      return null; // No redirection
    },

    // Platform adaptive behavior
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: kIsWeb
            ? const Center(child: Text('Page Not Found (Web)'))
            : const Center(child: Text('Page Not Found (Mobile)')),
      );
    },
  );

  static GoRoute _itemDetailsRoute() {
    return GoRoute(
      path: RoutePaths.itemDetails,
      name: RouteNames.itemDetails,
      builder: (context, state) {
        return const SampleFeaturePage();
      },
    );
  }

  static GoRoute _settingRoute({bool shell = false, bool isDrawer = false}) {
    return GoRoute(
      path: RoutePaths.settings,
      name: RouteNames.settings,
      builder: (context, state) => SampleFeaturePage(shell: shell),
    );
  }

  static GoRoute _homeRoute(bool shell) {
    return GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => !shell
          ? DashBoard(
              child: HomeScreen(
                onDirectionalityChanged: (p0) {},
                onThemeBrightnessChanged: (p0) {},
              ),
            )
          : HomeScreen(
              onDirectionalityChanged: (p0) {},
              onThemeBrightnessChanged: (p0) {},
            ),
    );
  }

  static BuildContext? get context => rootNavigatorKey.currentContext;
}
