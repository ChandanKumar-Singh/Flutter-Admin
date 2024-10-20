import 'package:admin/core/theme/index.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/material.dart';

class SidebarDrawer extends StatefulWidget {
  const SidebarDrawer({
    super.key,
    required this.child,
    this.onCreate,
    this.controller,
    required this.sideBarBuilder,
    this.minAdapterWidth = 800,
    this.drawerWidth = 300,
    this.duration = 5,
  });
  final double drawerWidth;
  final int duration;
  final Widget Function(
      BuildContext context, bool isOpen, VoidCallback toggleDrawer) child;
  final void Function(AnimationController controller)? onCreate;
  final AnimationController? controller;
  final Widget Function(
          BuildContext context, bool isOpen, VoidCallback toggleDrawer)
      sideBarBuilder;
  final double minAdapterWidth;

  @override
  _SidebarDrawerState createState() => _SidebarDrawerState();
}

class _SidebarDrawerState extends State<SidebarDrawer>
    with SingleTickerProviderStateMixin {
  bool drawerOpened = false;
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.duration),
        );

    _slideAnimation = Tween<double>(begin: -widget.drawerWidth, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    widget.onCreate?.call(_controller);
    afterBuildCreated(() {
      drawerOpened = context.isTablet() || context.isDesktop();
      if (drawerOpened) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    setState(() {
      drawerOpened = !drawerOpened;
      if (drawerOpened) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > widget.minAdapterWidth;
    CustomizasionThemeExt theme =
        Theme.of(context).extension<CustomizasionThemeExt>()!;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              // Sidebar for large screens
              if (isLargeScreen)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_slideAnimation.value, 0),
                      child: ClipRect(
                        child: AnimatedContainer(
                          width: drawerOpened
                              ? _controller.value * widget.drawerWidth
                              : 0,
                          duration: Duration(milliseconds: widget.duration),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: widget.sideBarBuilder(
                              context, drawerOpened, toggleDrawer),
                        ),
                      ),
                    );
                  },
                ),

              if (isLargeScreen && drawerOpened)
                const VerticalDivider(width: 0),
              // Main content
              Expanded(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(drawerOpened && isLargeScreen ? 0 : 0, 0),
                      child: widget.child(
                        context,
                        drawerOpened,
                        toggleDrawer,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Sidebar for smaller screens
          if (!isLargeScreen)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    // Background shadow effect when the sidebar is open
                    if (drawerOpened)
                      GestureDetector(
                        onTap: toggleDrawer,
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    // Sliding sidebar
                    Transform.translate(
                      offset: Offset(_slideAnimation.value, 0),
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Container(
                          width: widget.drawerWidth,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: widget.sideBarBuilder(
                            context,
                            drawerOpened,
                            toggleDrawer,
                          ),
                        ).cornerRadiusWithClipRRectOnly(
                          topRight: theme.radius.toInt(),
                          bottomRight: theme.radius.toInt(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}
