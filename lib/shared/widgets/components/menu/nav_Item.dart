import 'package:admin/shared/extensions/widget.dart';
import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final dynamic icon;
  final String title;
  final Widget? trailing; // Dynamic trailing widget
  final void Function()? onTap; // Callback function for tap events
  final Color? backgroundColor; // Background color for the item
  final double intendation; // Intendation for the item
  final bool isSelected;

  const NavItem({
    super.key,
    this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.intendation = 18.0,
    this.isSelected = false,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  ValueNotifier<bool> isHovering = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ValueListenableBuilder<bool>(
        valueListenable: isHovering,
        builder: (c, hovering, _) {
          return InkWell(
            onHover: (value) => isHovering.value = value,
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: hovering || widget.isSelected
                    ? theme.colorScheme.secondary.withOpacity(0.2)
                    : widget.backgroundColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: hovering || widget.isSelected
                      ? theme.colorScheme.secondary.withOpacity(0.25)
                      : Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: widget.intendation,
                        height: widget.intendation,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: getLeading()
                        ),
                      ),
                      SizedBox(width: widget.intendation * 2 / 3),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: hovering
                                ? theme.colorScheme.secondary:null,
                            //     : theme.colorScheme.onSurface,
                            fontWeight:
                                hovering ? FontWeight.w500 : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  if (widget.trailing != null)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: widget.trailing!,
                    ),
                ],
              ),
            ),
          ).tip(widget.title);
        });
  }

  Widget? getLeading() {
    if(widget.icon == null) return null;
    if (widget.icon is Icon) {
      return widget.icon!;
    }
    if(widget.icon is IconData) {
      return Icon(widget.icon as IconData);
    }
    return const SizedBox.shrink();
  }
}
