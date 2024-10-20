import 'package:admin/shared/extensions/index.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/material.dart';

class SheetHeaderWidget extends StatefulWidget {
  const SheetHeaderWidget(
      {super.key,
      required this.title,
      this.action = const [],
      required this.child});
  final String title;
  final List<Widget> action;
  final Widget child;

  @override
  State<SheetHeaderWidget> createState() => _SheetHeaderWidgetState();
}

class _SheetHeaderWidgetState extends State<SheetHeaderWidget> {
  final ValueNotifier<double> _elevation = ValueNotifier(0.0);
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          if (scrollNotification.metrics.pixels > 0 && _elevation.value == 0) {
            _elevation.value = 1.0;
          } else if (scrollNotification.metrics.pixels <= 0 &&
              _elevation.value != 0) {
            _elevation.value = 0.0;
          }
        }
        return true;
      },
      child: SafeArea(
        child: Column(
          children: [
            /// header
            ValueListenableBuilder<double>(
                valueListenable: _elevation,
                builder: (_, double elevation, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.customizationThemeExt.padding,
                        vertical: 5),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      boxShadow: [
                        if (elevation > 0)
                          BoxShadow(
                            color: context.theme.colorScheme.shadow,
                            offset: const Offset(0, 2),
                            blurRadius: elevation,
                          ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// close button
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            size: 25,
                            weight: 10,
                          ),
                        ).fitted(width: 30),
                        10.width,
        
                        /// title
                        Text(widget.title, style: context.textTheme.titleMedium)
                            .expand(),
        
                        /// actions
                        ...widget.action,
                      ],
                    ),
                  );
                }),
        
            /// body
            widget.child.expand(),
          ],
        ),
      ),
    );
  }
}
