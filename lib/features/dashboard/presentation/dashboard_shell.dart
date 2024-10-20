import 'package:flutter/material.dart';
import '../../../shared/widgets/index.dart';
import 'widgets/appbar.dart';
import 'widgets/drawer.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;
  const DashboardShell({super.key, required this.child});
  final double drawerWidth = 200;
  final double minAdapterWidth = 600;
  @override
  Widget build(BuildContext context) {
    return SidebarDrawer(
      drawerWidth: drawerWidth,
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
          body: Stack(
            children: [
              child,
              const Positioned(
                  bottom: 100, right: 5, child: ThemeCustomizationButton()),
            ],
          ),
        );
      },
    );
  }
}
