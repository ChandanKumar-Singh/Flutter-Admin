import 'package:admin/shared/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../core/routes/index.dart';
import '../animated_rotating_widget.dart';

class ThemeCustomizationButton extends StatelessWidget {
  const ThemeCustomizationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(20),
    
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ]
      ),
      child: IconButton(
        onPressed: () {
          // context.customizationThemeExt.updateRadius(1);
        },
        icon: const AnimatedRotatingWidget(
            child: Icon(Icons.settings, color: Colors.white)),
      ),
    ).tip("Customize Theme");
  }


  void _showCustomizationDialogDialog() {
    SideSheet.right(
      width: 250,
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                AppRouter.context!.customizationThemeExt.radius),
            bottomLeft: Radius.circular(
                AppRouter.context!.customizationThemeExt.radius),
          ),
        ),
      ),
      context: AppRouter.context!,
      sheetBorderRadius: AppRouter.context!.customizationThemeExt.radius,
    );
  }
}