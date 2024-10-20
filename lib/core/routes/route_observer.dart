import 'package:admin/core/routes/app_router.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'route_state.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  bool isIos = defaultTargetPlatform == TargetPlatform.iOS;
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _updateRouteState(route);
    String tag = "${isIos?'':'\u001b[32m'}[Pushed]${isIos?'':'\u001b[0m'}";
    print('$tag - ${route.settings.name} - ${route.settings.arguments}');
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
