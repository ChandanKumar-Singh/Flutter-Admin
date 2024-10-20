import 'package:flutter/material.dart';

class NavHeader extends StatelessWidget {
  /// Title text
  final String title;

  /// Caption text
  final String? caption;

  /// Custom style for the title
  final TextStyle? titleStyle;

  /// Custom style for the caption
  final TextStyle? captionStyle;
  final List<Widget> children;

  const NavHeader({
    super.key,
    required this.title,
    this.caption,
    this.titleStyle,
    this.captionStyle,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle ?? theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        if (caption != null && caption!.isNotEmpty)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 0.0),
            child: Text(
              caption!,
              style: captionStyle ?? theme.textTheme.labelSmall,
            ),
          ),
        if (children.isNotEmpty) ...[
          const SizedBox(height: 5.0),
          ...children,
        ]
      ],
    );
  }
}
