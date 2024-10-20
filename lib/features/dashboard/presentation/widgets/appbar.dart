import 'package:admin/shared/extensions/index.dart';
import 'package:admin/shared/widgets/components/modals/top_notificaiton_type_model.dart';
import 'package:el_tooltip/el_tooltip.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../../core/routes/index.dart';
import '../../../../shared/widgets/index.dart';

/// preferd sized widget appbar

class DashboardAppar extends StatelessWidget implements PreferredSizeWidget {
  final bool isOpen;
  final VoidCallback toggleDrawer;
  const DashboardAppar(
      {super.key, required this.isOpen, required this.toggleDrawer});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
      centerTitle: false,
      leading: IconButton(
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isOpen
              ? HugeIcon(
                  icon: HugeIcons.strokeRoundedMenu02,
                  color: context.iconColor,
                  size: 30.0,
                )
              : Transform.rotate(
                  angle: 3.14,
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedMenu11,
                    color: context.iconColor,
                    size: 30.0,
                  ),
                ),
        ),
        onPressed: toggleDrawer,
      ).tip('Toggle Drawer'),
      actions: [
        /// Theme Change Button
        Container(
          height: 35,
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: context.theme.colorScheme.secondary),
          ),
          child: Row(
            children: [
              Icon(
                context.isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: context.theme.colorScheme.onSurface,
                size: 20,
              ),
              if (context.isDesktop() || context.isTablet())
                Text(
                  context.isDark ? 'Light' : 'Dark',
                  style: context.textTheme.bodySmall!
                      .copyWith(color: context.theme.colorScheme.onSurface),
                ).paddingSymmetric(horizontal: 5),
            ],
          ).tip('Change Theme'),
        ).onTap(() {
          context.customizationThemeExt.toogleThemeMode();
        }, radius: 50),
        10.width,

        /// notification icon
        Container(
          height: 35,
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 5),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: const Row(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
                size: 20,
              ),
            ],
          ).onTap(_showNotificationDialog).tip('Notifications'),
        ),
        10.width,

        /// profile icon
        Container(
          height: 35,
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: context.theme.colorScheme.secondary),
          ),
          child: Row(
            children: [
              /// profile image
              Container(
                constraints: const BoxConstraints(
                  minWidth: 28,
                  minHeight: 28,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        color: context.theme.primaryColor,
                      );
                    },
                  ),
                ),
              ),
              if (context.isDesktop() || context.isTablet())
                Text(
                  'Admin',
                  style: context.textTheme.bodySmall!
                      .copyWith(color: context.theme.colorScheme.onSurface),
                ).paddingSymmetric(horizontal: 5),
            ],
          ),
        ).onTap(
          // () => showTopNotification(context),
          () {},

          radius: 50,
        ),

        10.width,
      ],
    );
  }

  void _showNotificationDialog() {
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
        child: SheetHeaderWidget(
          title: 'Notifications',
          child: ListView(
            children: [
              ...List.generate(
                10,
                (index) => ListTile(
                  title: Text('Notification $index'),
                  subtitle: Text('Notification $index description'),
                  leading: const Icon(Icons.notifications_none_outlined),
                ),
              ),
            ],
          ),
        ),
      ).cornerRadiusWithClipRRectOnly(
        topLeft: AppRouter.context!.customizationThemeExt.radius.toInt(),
        bottomLeft: AppRouter.context!.customizationThemeExt.radius.toInt(),
      ),
      context: AppRouter.context!,
      sheetBorderRadius: AppRouter.context!.customizationThemeExt.radius,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
