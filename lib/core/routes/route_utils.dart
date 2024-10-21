import 'package:admin/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

class RouteUtils {
  /// Navigate to a specific route by name.
  static void go(String routeName, {Map<String, String>? params}) {
    String path = RoutePaths.getPath(routeName, params);
    AppRouter.context?.go(path);
  }

  /// Push a new page onto the navigation stack.
  static Future<T?> push<T>(String routeName,
      {Map<String, String>? params}) async {
    String path = RoutePaths.getPath(routeName, params);
    return AppRouter.context?.push(path);
  }

  /// Replace the current page with a new page.
  static void replace(String routeName, {Map<String, String>? params}) async {
    String path = RoutePaths.getPath(routeName, params);
    return AppRouter.context?.pushReplacementNamed(path);
  }

  /// Navigate back to the previous page.
  static void goBack<T extends Object?>([T? result]) {
    if (AppRouter.router.canPop()) {
      AppRouter.context?.pop(result);
    }
  }

  /// Show a dialog with a confirmation message before navigating.
  static Future<bool?> showConfirmationDialog(
      BuildContext context, String message) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Navigation'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
