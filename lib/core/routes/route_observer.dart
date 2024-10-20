import 'package:admin/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'route_state.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _updateRouteState(route);
    print('\u001b[32m[Pushed]\u001b[0m ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _updateRouteState(previousRoute);
    print('\u001b[32m[Poped]\u001b[0m ${previousRoute?.settings.name}');  
  }

  void _updateRouteState(Route<dynamic>? route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = AppRouter.context;
      if (context != null && route != null) {
        final routeState = Provider.of<RouteState>(context, listen: false);
        routeState.updateRoute(route.settings.name ?? "Unknown", context);
      }
    });
  }
}
