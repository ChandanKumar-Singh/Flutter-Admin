import 'package:admin/core/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'core/routes/index.dart'; // Ensure this points to your routing setup

void main() {
  /// [x] : Set the optionURLReflectsImperativeAPIs to true
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => CustomizasionThemeExt(radius: 10)),
      ChangeNotifierProvider(create: (context) => RouteState()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GoRouter _router = AppRouter.router;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _router.routeInformationProvider.addListener(() {
        print(
            'Route Information Provider Listener ${_router.routeInformationProvider.value.uri}');
        final state = Provider.of<RouteState>(context, listen: false);
        state.updateRoute(
            _router.routeInformationProvider.value.uri.path, AppRouter.context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Web Admin',
        theme: AdminTheme.buildTheme(
            customizasionExt: Provider.of<CustomizasionThemeExt>(context),
            exenstions: [
              WoltModalSheetThemeData(
                modalBarrierColor: Color(0x52000000),
                surfaceTintColor: Colors.transparent,
              ),
            ]),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        builder: FlutterSmartDialog.init(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ),
      );
    });
  }
}
