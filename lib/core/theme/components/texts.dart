import 'package:flutter/material.dart';

// TitleText Widget
class TitleText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final VoidCallback? onTap; // Clickable
  final List<Shadow>? shadows; // Text shadow
  final double? letterSpacing; // Letter spacing
  final double? height; // Line height

  const TitleText(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.onTap,
    this.shadows,
    this.letterSpacing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: style?.color,
          fontSize: style?.fontSize,
          fontWeight: style?.fontWeight,
          letterSpacing: letterSpacing,
          height: height,
        );

    return GestureDetector(
      onTap: onTap, // Handle tap
      child: Text(
        data,
        style: titleStyle.merge(style).copyWith(
            shadows: shadows), // Merge the custom style with the theme
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: TextScaler.linear(textScaleFactor ?? 1.0),
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      ),
    );
  }
}

// HeaderText Widget
class HeaderText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final VoidCallback? onTap; // Clickable
  final List<Shadow>? shadows; // Text shadow
  final double? letterSpacing; // Letter spacing
  final double? height; // Line height
  final TextDecoration? decoration; // Text decoration

  const HeaderText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.onTap,
    this.shadows,
    this.letterSpacing,
    this.height,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: style?.color,
          letterSpacing: letterSpacing,
          height: height,
          decoration: decoration,
        );

    return GestureDetector(
      onTap: onTap, // Handle tap
      child: Text(
        data,
        style: headerStyle.merge(style).copyWith(shadows: shadows),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}

// CaptionText Widget
class CaptionText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final VoidCallback? onTap; // Clickable
  final List<Shadow>? shadows; // Text shadow
  final double? letterSpacing; // Letter spacing
  final double? height; // Line height
  final TextDecoration? decoration; // Text decoration

  const CaptionText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.onTap,
    this.shadows,
    this.letterSpacing,
    this.height,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle captionStyle = Theme.of(context).textTheme.labelSmall!.copyWith(
          color: style?.color,
          letterSpacing: letterSpacing,
          height: height,
          decoration: decoration,
        );

    return GestureDetector(
      onTap: onTap, // Handle tap
      child: Text(
        data,
        style: captionStyle.merge(style).copyWith(shadows: shadows),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}
