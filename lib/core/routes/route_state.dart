import 'dart:async';

import 'package:flutter/material.dart';

class RouteState extends ChangeNotifier {
  String? _currentRoute;
  BuildContext? _currentContext;
  final List<String> _routeHistory = [];
  final StreamController<String> _currentRouteController = StreamController<String>.broadcast();
  Stream<String> get currentRouteStream => _currentRouteController.stream;

  String? get currentRoute => _currentRoute;
  BuildContext? get currentContext => _currentContext;
  List<String> get routeHistory => List.unmodifiable(_routeHistory);

  void updateRoute(String route, BuildContext? context) {
    _currentRoute = route;
    _currentContext = context;
    _routeHistory.add(route);
    _currentRouteController.add(route);
    notifyListeners();
  }

  void removeLastRoute() {
    if (_routeHistory.isNotEmpty) {
      _routeHistory.removeLast();
    }
    notifyListeners();
  }
}
