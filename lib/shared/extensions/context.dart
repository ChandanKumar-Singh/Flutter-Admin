import 'package:admin/core/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ContextExtension on BuildContext? {
  CustomizasionThemeExt get customizationThemeExt =>
      Provider.of<CustomizasionThemeExt>(this!, listen: false);

  // bool get isDesktop => ResponsiveBreakpoints.of(this!).isDesktop;

  // bool get isMobile => ResponsiveBreakpoints.of(this!).isMobile;

  // bool get isTablet => ResponsiveBreakpoints.of(this!).isTablet;

  // bool get largerThanMobile => isDesktop || isTablet;
}
