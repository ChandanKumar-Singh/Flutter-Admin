import 'package:flutter/material.dart';
import 'package:el_tooltip/el_tooltip.dart';

extension WidgetExt on Widget? {
  // Use an empty widget if null
  Widget get _empty => this ?? const SizedBox.shrink();

  /// Smart tooltip with enhanced customization and better defaults
  Widget tip(
    String message, {
    InlineSpan? richMessage,
    double height = 32.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 4.0),
    double verticalOffset = 16.0,
    bool preferBelow = true,
    bool excludeFromSemantics = false,
    Decoration? decoration,
    TextStyle? textStyle,
    TextAlign? textAlign = TextAlign.center,
    Duration waitDuration = const Duration(milliseconds: 500), // Smarter delay
    Duration showDuration = const Duration(seconds: 2),
    Duration exitDuration =
        const Duration(milliseconds: 200), // Faster dismissal
    bool enableTapToDismiss = true,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.longPress,
    bool enableFeedback = true,
    AlignmentGeometry alignment = Alignment.center,
    bool disableOnHover = false, // Custom option to disable on hover
  }) {
    return Align(
      alignment: alignment,
      child: Tooltip(
        message: message,
        richMessage: richMessage,
        height: height,
        padding: padding,
        margin: margin,
        verticalOffset: verticalOffset,
        preferBelow: preferBelow,
        excludeFromSemantics: excludeFromSemantics,
        decoration: decoration??  BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black54, width: 1.0),
        ),
        textStyle: textStyle,
        textAlign: textAlign,
        waitDuration: waitDuration, // Adjusted for smarter timing
        showDuration: showDuration,
        exitDuration: exitDuration,
        triggerMode: triggerMode,
        enableFeedback: enableFeedback,
        child: _empty,
      ),
    );
  }

  Widget toolTip2(String message, {Key? key}) {
    return ElTooltip( 
      key: key,
      content: Text(message),
      child: _empty,
    );
  }
}
