import 'package:flutter/material.dart';

class DraggableFloatingWidget extends StatefulWidget {
  final Widget child;
  final Widget floatingContent;
  final Offset initialOffset;
  final ValueNotifier<Offset> anchorPosition;
  final Offset Function(Size widgetSize, Size screenSize)? minOffset;
  final Offset Function(Size widgetSize, Size screenSize)? maxOffset;
  final double floatingWidgetHeight;
  final double floatingWidgetWidth;
  final Size? screenSize;

  const DraggableFloatingWidget({
    super.key,
    required this.child,
    required this.floatingContent,
    this.initialOffset = Offset.zero,
    required this.anchorPosition,
    this.minOffset,
    this.maxOffset,
    this.floatingWidgetHeight = 100.0,
    this.floatingWidgetWidth = 100.0,
    this.screenSize,
  });

  @override
  _DraggableFloatingWidgetState createState() =>
      _DraggableFloatingWidgetState();
}

class _DraggableFloatingWidgetState extends State<DraggableFloatingWidget> {
  late Offset currentOffset;
  Size? parentSize;

  @override
  void initState() {
    super.initState();
    currentOffset = widget.initialOffset;
    widget.anchorPosition.value = currentOffset;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      final Size screenSize = widget.screenSize ?? MediaQuery.of(context).size;
      final Offset minOffset = widget.minOffset?.call(
            Size(widget.floatingWidgetWidth, widget.floatingWidgetHeight),
            screenSize,
          ) ??
          Offset.zero;
      final Offset maxOffset = widget.maxOffset?.call(
            Size(widget.floatingWidgetWidth, widget.floatingWidgetHeight),
            screenSize,
          ) ??
          Offset(screenSize.width - widget.floatingWidgetWidth,
              screenSize.height - widget.floatingWidgetHeight);
      print('minOffset: $minOffset');
      print('maxOffset: $maxOffset');
      print('details.delta: ${details.delta}');
      print('ScreenSize: $screenSize');
      print('currentOffset: $currentOffset');

      // currentOffset += details.delta;

      currentOffset = Offset(
        (currentOffset.dx + details.delta.dx).clamp(minOffset.dx, maxOffset.dx),
        (currentOffset.dy + details.delta.dy).clamp(minOffset.dy, maxOffset.dy),
      );

      widget.anchorPosition.value = currentOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          left: currentOffset.dx,
          top: currentOffset.dy,
          child: GestureDetector(
            onPanUpdate: _onDragUpdate,
            child: SizedBox(
              height: widget.floatingWidgetHeight,
              width: widget.floatingWidgetWidth,
              child: widget.floatingContent,
            ),
          ),
        ),
      ],
    );
  }
}
