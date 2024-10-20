import 'package:admin/core/constants/assets_const.dart';
import 'package:admin/features/dashboard/presentation/widgets/data.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/index.dart';
import '../../../../core/routes/index.dart';
import '../../../../shared/widgets/index.dart';

class DashBoardDrawer extends StatefulWidget {
  const DashBoardDrawer({
    super.key,
    required this.isOpen,
    required this.toggleDrawer,
    this.width = 250,
  });
  final double width;
  final bool isOpen;
  final VoidCallback toggleDrawer;

  @override
  State<DashBoardDrawer> createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<DashBoardDrawer> {
  List<MenuItem> navItems = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navItems = parseMenuItems(navItemsJson);
      if (context.mounted) setState(() {});
      RouteState routeState = context.read<RouteState>();
      routeState.currentRouteStream.listen((event) {
        setState(() {});
      });
    });
  }

  bool isSelected(String key) {
    RouteState routeState = context.read<RouteState>();
    return (routeState.currentRoute.validate().startsWith(key));
  }

  bool isExpanded(List<MenuItem> children) {
    return children.any((item) => isSelected(item.url.validate()));
  }

  void onTap(String key) {
    switch (key) {
      case 'general-settings':
        RouteUtils.push(RouteNames.settings);
        break;
      default:
        RouteUtils.push(RouteNames.commingSoon,
            params: {'shell': kIsWeb ? '0' : '1'});
    }
    widget.toggleDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, bound) {
      bool canShow = bound.maxWidth > widget.width * 2 / 3;
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              if (canShow)
                // Image.network(
                //   "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.2113030492.1729296000&semt=ais_hybrid",
                //   width: canShow ? width : 0,
                //   height: canShow ? 100 : 0,
                //   loadingBuilder: (BuildContext context, Widget child,
                //       ImageChunkEvent? loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return Center(
                //       child: CircularProgressIndicator(
                //         value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.cumulativeBytesLoaded /
                //                 (loadingProgress.expectedTotalBytes ?? 1)
                //             : null,
                //       ),
                //     );
                //   },
                //   // errorBuilder:
                //   //     (BuildContext context, Object error, StackTrace? stackTrace) {
                //   //   return const Text('Failed to load image');
                //   // },
                // ),

                Image.asset(PngConst.logo),
              // Sidebar Menu Items
              if (canShow)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsetsDirectional.all(16.0),
                    children: [
                      ...navItems.map((item) {
                        if (item.type == 'group') {
                          return Padding(
                            padding:
                                const EdgeInsetsDirectional.only(top: 16.0),
                            child: NavHeader(
                              title: item.title,
                              caption: item.caption,
                              children: item.children!.map((child) {
                                switch (child.type) {
                                  case 'item':
                                    return NavItem(
                                      icon: child.icon,
                                      title: child.title,
                                      onTap: () => onTap(child.id),
                                      isSelected:
                                          isSelected(child.url.validate()),
                                    );
                                  case 'collapse':
                                    return NavCollapse(
                                      icon: child.icon,
                                      title: child.title,
                                      // expanded : isSelected(child.id),
                                      children: child.children!
                                          .map(
                                            (subChild) => NavItem(
                                              icon: subChild.icon,
                                              title: subChild.title,
                                              onTap: () => onTap(subChild.id),
                                              isSelected: isSelected(
                                                  subChild.url.validate()),
                                            ),
                                          )
                                          .toList(),
                                    );
                                  default:
                                    return const SizedBox();
                                }
                              }).toList(),
                            ),
                          );
                        } else if (item.type == 'item') {
                          return ListTile(
                            leading: Icon(item.icon),
                            title: Text(item.title),
                            onTap: () {
                              RouteUtils.push(item.url!);
                              // GoRouter.of(context).push(item.url!);

                              if (!kIsWeb && widget.isOpen) {
                                widget.toggleDrawer();
                              }
                            },
                          );
                        } else if (item.type == 'collapse') {
                          return NavCollapse(
                            icon: Icon(item.icon),
                            title: item.title,
                            children: item.children!
                                .map((child) => NavItem(
                                      icon: child.icon,
                                      title: child.title,
                                      onTap: () {
                                        print('${child.title} tapped');
                                      },
                                    ))
                                .toList(),
                          );
                        }
                        return const SizedBox();
                      }),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
