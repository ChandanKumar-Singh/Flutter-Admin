import 'package:admin/core/routes/routes.dart';

class RoutePaths {
  static const String home = '/dashboard';
  static const String commingSoon = '/commingSoon';
  static const String login = '/login';
  static const String settings = '/settings/general';
  static const String itemDetails = '/item/:itemId';

  static String getPath(String routeName, [Map<String, String>? params]) {
    String path;

    switch (routeName) {
      case RouteNames.home:
        path = home;
        break;
      case RouteNames.login:
        path = login;
        break;
      case RouteNames.settings:
        path = settings;
        break;
      case RouteNames.itemDetails:
        final itemId = params?['itemId'];
        path = itemDetails.replaceAll(':itemId', itemId!);
        break;
      case RouteNames.commingSoon:
        path = commingSoon;
        break;
      default:
        path = home;
    }

    Uri uri = Uri(path: path, queryParameters: params);
    return uri.toString();
  }
}
