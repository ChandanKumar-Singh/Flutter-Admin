import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/material.dart';

class NavCollapse extends StatefulWidget {
  final dynamic icon;
  final String title;
  final List<Widget>? children;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? backgroundColor;
  final double intendation;
  final bool isExpanded;

  const NavCollapse({
    super.key,
    required this.icon,
    required this.title,
    this.children,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.intendation = 18.0,
    this.isExpanded = false,
  });

  @override
  State<NavCollapse> createState() => _NavCollapseState();
}

class _NavCollapseState extends State<NavCollapse> with WidgetsBindingObserver {
  ValueNotifier<bool> isHovering = ValueNotifier(false);
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant NavCollapse oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isHovering,
          builder: (context, hovering, _) {
            return InkWell(
              onHover: (value) => isHovering.value = value,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 8.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: hovering
                          ? theme.colorScheme.secondary.withOpacity(0.2)
                          : widget.backgroundColor ?? Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: hovering
                            ? theme.colorScheme.secondary.withOpacity(0.25)
                            : Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: widget.intendation,
                                height: widget.intendation,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: getLeading(),
                                ),
                              ),
                              SizedBox(width: widget.intendation * 2 / 3),
                              Expanded(
                                child: Text(
                                  widget.title,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: hovering
                                        ? theme.colorScheme.secondary
                                        : null,
                                    fontWeight: hovering
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: widget.intendation * 2 / 3),
                            ],
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: hovering
                              ? theme.colorScheme.secondary
                              : null,
                        ),
                      ],
                    ),
                  ),

                  /// trailing widget
                  if (widget.trailing != null)
                    Positioned(
                      right: 0,
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        width: widget.intendation,
                        height: widget.intendation,
                        child: widget.trailing,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        if (isExpanded && widget.children != null) ...[
          ...widget.children!.map((child) => Padding(
                padding: EdgeInsets.only(left: widget.intendation),
                child: child,
              )),
        ],
      ],
    );
  }

  Widget? getLeading() {
    if (widget.icon == null) return null;
    if (widget.icon is Icon) {
      return widget.icon!;
    }
    if (widget.icon is IconData) {
      return Icon(widget.icon as IconData);
    }
    return const SizedBox.shrink();
  }
}
