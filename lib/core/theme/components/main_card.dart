import 'package:flutter/material.dart';

// MainCard Widget
class MainCard extends StatelessWidget {
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final Widget? child;
  final bool semanticContainer;
  final double padding;

  const MainCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    required this.child,
    this.semanticContainer = true,
    this.padding = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin ?? const EdgeInsets.all(0.0),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      semanticContainer: semanticContainer,
      child: Padding(
        padding:  EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
