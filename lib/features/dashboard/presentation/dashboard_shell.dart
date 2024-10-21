import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/index.dart';
import 'widgets/appbar.dart';
import 'widgets/drawer.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;
  const DashboardShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DashBoard(child: child);
  }
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key, required this.child});

  final Widget child;
  final double drawerWidth = kIsWeb ? 250 : 300;
  final double minAdapterWidth = 600;
  @override
  Widget build(BuildContext context) {
    return SidebarDrawer(
      drawerWidth: drawerWidth,
      duration: kIsWeb ? 10 : 300,
      sideBarBuilder: (context, isOpen, toggleDrawer) {
        return DashBoardDrawer(
            isOpen: isOpen, toggleDrawer: toggleDrawer, width: drawerWidth);
      },
      minAdapterWidth: minAdapterWidth,
      child: (context, isOpen, toggleDrawer) {
        return Scaffold(
          appBar: DashboardAppar(
            isOpen: isOpen,
            toggleDrawer: toggleDrawer,
          ),
          body: DraggableFloatingWidget(
            floatingContent: const ThemeCustomizationButton(),
            initialOffset: Offset(context.width() - 50, kToolbarHeight * 3),
            anchorPosition: ValueNotifier(Offset.zero),
            floatingWidgetHeight: 50 * 2,
            floatingWidgetWidth: 50,
            child: child,
          ),
        );
      },
    );
  }
}
