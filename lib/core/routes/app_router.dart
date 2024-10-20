import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/index.dart';
import '../../features/not-found/index.dart';
import 'index.dart';

class AppRouter {
  // private navigators
  static final rootNavigatorKey = Get.key;
  static final shellNavigatorAKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellA');
  static final shellNavigatorBKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellB');

  static GoRouter router = GoRouter(
    // Initial route
    initialLocation: RoutePaths.home,
    navigatorKey: rootNavigatorKey,
    observers: [AppRouteObserver(),FlutterSmartDialog.observer],

    // List of all routes
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            DashboardShell(child: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorAKey,
            routes: [
              GoRoute(
                path: RoutePaths.home,
                name: RouteNames.home,
                builder: (context, state) => const SampleFeaturePage(),
              ),
              GoRoute(
                path: RoutePaths.settings,
                name: RouteNames.settings,
                builder: (context, state) => const SampleFeaturePage(),
              ),
              GoRoute(
                path: RoutePaths.itemDetails,
                name: RouteNames.itemDetails,
                builder: (context, state) {
                  return const SampleFeaturePage();
                },
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => const SampleFeaturePage(),
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

  static BuildContext? get context =>
      Get.context ?? rootNavigatorKey.currentContext;
}
