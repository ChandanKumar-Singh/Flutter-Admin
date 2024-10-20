import 'dart:ui';

import 'package:flutter/material.dart';

class CustomizasionThemeExt extends ThemeExtension<CustomizasionThemeExt>
    with ChangeNotifier {
  double radius;
  double padding;
  ThemeMode themeMode;

  CustomizasionThemeExt(
      {required this.radius,
      this.themeMode = ThemeMode.dark,
      this.padding = 10});

  toogleThemeMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void updateRadius(double newRadius) {
    if (newRadius != radius) {
      radius += newRadius;
      notifyListeners();
    }
  }

  @override
  CustomizasionThemeExt copyWith({double? radius, ThemeMode? themeMode, double? padding}) {
    return CustomizasionThemeExt(
      radius: radius ?? this.radius,
      themeMode: themeMode ?? this.themeMode,
      padding: padding ?? this.padding,
    );
  }

  @override
  CustomizasionThemeExt lerp(
      ThemeExtension<CustomizasionThemeExt>? other, double t) {
    if (other is! CustomizasionThemeExt) return this;

    return CustomizasionThemeExt(
      radius: lerpDouble(radius, other.radius, t)!,
    );
  }
}
