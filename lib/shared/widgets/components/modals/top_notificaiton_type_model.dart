// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

// SliverWoltModalSheetPage page2(
//     BuildContext modalSheetContext, TextTheme textTheme) {
//   return SliverWoltModalSheetPage(
//     pageTitle: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Text(
//         'Material Colors',
//         style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
//       ),
//     ),
//     heroImage: const Image(
//       image: NetworkImage(
//         'https://raw.githubusercontent.com/woltapp/wolt_modal_sheet/main/example/lib/assets/images/material_colors_hero${true ? '_light' : '_dark'}.png',
//       ),
//       fit: BoxFit.cover,
//     ),
//     leadingNavBarWidget: IconButton(
//       padding: const EdgeInsets.all(10),
//       icon: const Icon(Icons.arrow_back_rounded),
//       onPressed: WoltModalSheet.of(modalSheetContext).showPrevious,
//     ),
//     trailingNavBarWidget: IconButton(
//       padding: const EdgeInsets.all(10),
//       icon: const Icon(Icons.close),
//       onPressed: Navigator.of(modalSheetContext).pop,
//     ),
//     mainContentSliversBuilder: (context) => [
//       SliverGrid(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 10.0,
//           crossAxisSpacing: 10.0,
//           childAspectRatio: 2.0,
//         ),
//         delegate: SliverChildBuilderDelegate(
//           (_, index) => ListTile(
//             title: Text('Color ${index + 1}'),
//           ),
//           childCount: 5,
//         ),
//       ),
//       SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (_, index) => ListTile(
//             title: Text('Color ${index + 6}'),
//           ),
//           childCount: 5,
//         ),
//       ),
//     ],
//   );
// }

// void showTopNotification(BuildContext context) {
//   WoltModalSheet.show(
//       context: context,
//       modalTypeBuilder: (context) => const TopNotificationSheetType(),
//       pageListBuilder: (context) => [
//             SliverWoltModalSheetPage(
//               pageTitle: const Text('Notification'),
//               mainContentSliversBuilder: (context) => [
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Text(
//                       'This is a notification message. It will be shown at the top of the screen.',
//                       style: Theme.of(context).textTheme.bodySmall,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ]);
// }



// const double _contentWidth = 300.0;
// const double _breakPoint = 524.0;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({
//     required this.onThemeBrightnessChanged,
//     required this.onDirectionalityChanged,
//     super.key,
//   });

//   final void Function(bool) onThemeBrightnessChanged;
//   final void Function(TextDirection) onDirectionalityChanged;

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool _isSlowAnimation = false;
//   bool _isLightTheme = true;
//   _Responsiveness _selectedResponsiveness = _Responsiveness.auto;
//   TextDirection _selectedDirection = TextDirection.ltr;

//   final GlobalKey _attachedAppBarKey = GlobalKey();
//   final GlobalKey _attachedRandomKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Wolt Modal Sheet Playground'),
//           leading: IconButton(
//             key: _attachedAppBarKey,
//             icon: const Icon(Icons.anchor),
//             onPressed: () {
//               WoltModalSheet.show(
//                 context: context,
//                 modalTypeBuilder: (_) => AttachedFloatingBottomSheetType(
//                   anchorKey: _attachedAppBarKey,
//                 ),
//                 pageListBuilder: (_) => [NewOrderNotificationPage()],
//               );
//             },
//           ),
//           actions: [
//             WoltCircularElevatedButton(
//               onPressed: () {
//                 timeDilation = _isSlowAnimation ? 1.0 : 8.0;
//                 _isSlowAnimation = !_isSlowAnimation;
//               },
//               icon: Icons.speed_outlined,
//             ),
//             const SizedBox(width: 16),
//           ],
//         ),
//         body: Builder(builder: (context) {
//           return Align(
//             alignment: Alignment.center,
//             child: SizedBox(
//               width: _contentWidth,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Select responsiveness',
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleMedium!
//                               .copyWith(fontWeight: FontWeight.bold),
//                         ),
//                         WoltSelectionList<_Responsiveness>.singleSelect(
//                           tilePadding: const EdgeInsetsDirectional.symmetric(
//                               vertical: 8),
//                           itemTileDataGroup: WoltSelectionListItemDataGroup(
//                             group: _Responsiveness.values
//                                 .map(
//                                   (e) => WoltSelectionListItemData(
//                                     title: e.label,
//                                     value: e,
//                                     isSelected: _selectedResponsiveness == e,
//                                   ),
//                                 )
//                                 .toList(),
//                           ),
//                           onSelectionUpdateInSingleSelectionList:
//                               (selectedItem) {
//                             _selectedResponsiveness = selectedItem.value;
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text('Light Theme'),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Switch(
//                             value: !_isLightTheme,
//                             onChanged: (bool newValue) {
//                               _isLightTheme = !newValue;
//                               widget.onThemeBrightnessChanged(_isLightTheme);
//                             },
//                           ),
//                         ),
//                         const Text('Dark Theme'),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Expanded(child: SizedBox.shrink()),
//                         const Text('LTR'),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Switch(
//                             value: _selectedDirection == TextDirection.rtl,
//                             onChanged: (bool newValue) {
//                               _selectedDirection = newValue
//                                   ? TextDirection.rtl
//                                   : TextDirection.ltr;
//                               widget
//                                   .onDirectionalityChanged(_selectedDirection);
//                             },
//                           ),
//                         ),
//                         const Text('RTL'),
//                         Expanded(
//                             child: Center(
//                           child: IconButton(
//                             key: _attachedRandomKey,
//                             icon: const Icon(Icons.anchor),
//                             onPressed: () {
//                               WoltModalSheet.show(
//                                 context: context,
//                                 modalTypeBuilder: (_) =>
//                                     AttachedFloatingBottomSheetType(
//                                   anchorKey: _attachedRandomKey,
//                                 ),
//                                 pageListBuilder: (_) =>
//                                     [NewOrderNotificationPage()],
//                               );
//                             },
//                           ),
//                         ))
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: _contentWidth,
//                       child: WoltElevatedButton(
//                         onPressed: () {
//                           WoltModalSheet.show(
//                             context: context,
//                             modalTypeBuilder: (BuildContext context) {
//                               final woltDialogType = _isLightTheme
//                                   ? const WoltDialogType()
//                                   : const WoltDialogType().copyWith(
//                                       shapeBorder:
//                                           const BeveledRectangleBorder(),
//                                     );
//                               final woltAlertDialogType = _isLightTheme
//                                   ? const WoltAlertDialogType()
//                                   : const WoltDialogType().copyWith(
//                                       shapeBorder:
//                                           const BeveledRectangleBorder(),
//                                     );
//                               final bottomSheetType = _isLightTheme
//                                   ? const WoltBottomSheetType()
//                                   : const WoltBottomSheetType().copyWith(
//                                       shapeBorder:
//                                           const BeveledRectangleBorder(),
//                                     );
//                               final sideSheetType = _isLightTheme
//                                   ? const WoltSideSheetType()
//                                   : const WoltSideSheetType().copyWith(
//                                       shapeBorder:
//                                           const BeveledRectangleBorder(),
//                                     );
//                               switch (_selectedResponsiveness) {
//                                 case _Responsiveness.alwaysDialog:
//                                   return woltDialogType;
//                                 case _Responsiveness.alwaysAlertDialog:
//                                   return woltAlertDialogType;
//                                 case _Responsiveness.alwaysBottomSheet:
//                                   return bottomSheetType;
//                                 case _Responsiveness.alwaysSideSheet:
//                                   return sideSheetType;
//                                 case _Responsiveness.auto:
//                                   final width =
//                                       MediaQuery.sizeOf(context).width;
//                                   return width < _breakPoint
//                                       ? bottomSheetType
//                                       : woltDialogType;
//                               }
//                             },
//                             onModalDismissedWithDrag: () {
//                               debugPrint(
//                                   'Bottom sheet is dismissed with drag.');
//                               Navigator.of(context).pop();
//                             },
//                             onModalDismissedWithBarrierTap: () {
//                               debugPrint(
//                                   'Modal is dismissed with barrier tap.');
//                               Navigator.of(context).pop();
//                             },
//                             pageListBuilder: (BuildContext context) {
//                               return [RootSheetPage.build(context)];
//                             },
//                           );
//                         },
//                         child: const Text('Show Modal Sheet'),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       width: _contentWidth,
//                       child: WoltElevatedButton(
//                         onPressed: () {
//                           WoltModalSheet.show(
//                             context: context,
//                             modalTypeBuilder: (_) =>
//                                 const TopNotificationSheetType(),
//                             pageListBuilder: (_) =>
//                                 [NewOrderNotificationPage()],
//                           );
//                         },
//                         child: const Text('Show Custom Modal Sheet'),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             WoltModalSheet.show(
//               context: context,
//               modalTypeBuilder: (_) => const FloatingBottomSheetType(),
//               pageListBuilder: (_) => [NewOrderNotificationPage()],
//             );
//           },
//           child: const Icon(Icons.notifications_active),
//         ));
//   }
// }

// enum _Responsiveness {
//   alwaysDialog('Always dialog'),
//   alwaysAlertDialog('Always alert dialog'),
//   alwaysBottomSheet('Always bottom sheet'),
//   alwaysSideSheet('Always side sheet'),
//   auto('Auto');

//   final String label;

//   const _Responsiveness(this.label);
// }

// class TopNotificationSheetType extends WoltModalType {
//   final EdgeInsetsDirectional padding;

//   const TopNotificationSheetType({
//     this.padding = const EdgeInsetsDirectional.all(32.0),
//   }) : super(
//           shapeBorder: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(24))),
//           dismissDirection: WoltModalDismissDirection.up,
//           showDragHandle: false,
//           closeProgressThreshold: 0.8,
//           barrierDismissible: false,
//         );

//   @override
//   String routeLabel(BuildContext context) {
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     return localizations.dialogLabel;
//   }

//   @override
//   BoxConstraints layoutModal(Size availableSize) {
//     final availableWidth = availableSize.width;
//     double width =
//         availableWidth > 523.0 ? 312.0 : availableWidth - padding.end;
//     return BoxConstraints(
//       minWidth: width,
//       maxWidth: width,
//       minHeight: 0,
//       maxHeight: availableSize.height * 0.6,
//     );
//   }

//   @override
//   Offset positionModal(
//       Size availableSize, Size modalContentSize, TextDirection textDirection) {
//     final xOffset =
//         max(0.0, (availableSize.width - modalContentSize.width) / 2);
//     final yOffset = padding.top;
//     return Offset(xOffset, yOffset);
//   }

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     final alphaAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: animation,
//       curve: const Interval(0.0, 100.0 / 300.0, curve: Curves.linear),
//       reverseCurve: const Interval(100.0 / 250.0, 1.0, curve: Curves.linear),
//     ));

//     return FadeTransition(
//       opacity: alphaAnimation,
//       child: SlideTransition(
//         position: animation.drive(
//           Tween(
//             begin: const Offset(0.0, -1.0),
//             end: Offset.zero,
//           ).chain(CurveTween(curve: Curves.easeOutQuad)),
//         ),
//         child: child,
//       ),
//     );
//   }
// }

// import 'package:demo_ui_components/demo_ui_components.dart';
// import 'package:flutter/material.dart';
// import 'package:playground/home/pages/custom_sheet_pages/adjust_time_notification_page.dart';
// import 'package:playground/home/pages/custom_sheet_pages/reject_order_notification_page.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

// class NewOrderNotificationPage extends WoltModalSheetPage {
//   NewOrderNotificationPage()
//       : super(
//           hasTopBarLayer: false,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Builder(builder: (context) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const ModalSheetTitle(
//                     'Can you have the order ready in 34 minutes?',
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   const ModalSheetContentText(
//                     'Suggested time is based on your average preparation time.',
//                   ),
//                   const SizedBox(height: 16),
//                   WoltElevatedButton(
//                     height: _buttonHeight,
//                     onPressed: Navigator.of(context).pop,
//                     child: const Text('Yes'),
//                   ),
//                   const SizedBox(height: 4),
//                   WoltElevatedButton(
//                     height: _buttonHeight,
//                     onPressed: () {
//                       WoltModalSheet.of(context)
//                         ..addOrReplacePage(AdjustTimeNotificationPage())
//                         ..showNext();
//                     },
//                     theme: WoltElevatedButtonTheme.secondary,
//                     child: const Text('Adjust time'),
//                   ),
//                   const SizedBox(height: 4),
//                   WoltElevatedButton(
//                     height: _buttonHeight,
//                     onPressed: () {
//                       WoltModalSheet.of(context)
//                         ..addOrReplacePage(RejectOrderNotificationPage())
//                         ..showNext();
//                     },
//                     theme: WoltElevatedButtonTheme.secondary,
//                     colorName: WoltColorName.red,
//                     child: const Text('Reject order'),
//                   ),
//                 ],
//               );
//             }),
//           ),
//         );

//   static const double _buttonHeight = 24.0;
// }

// /// A [WoltModalType] that displays a floating bottom sheet which is dynamically positioned
// /// relative to an anchor widget identified by [anchorKey]. This modal type allows for a
// /// customizable presentation of content in relation to a specific UI element, enhancing
// /// contextual awareness for the user.
// ///
// /// ## Usage
// /// This modal type is designed to be used when there is a need to display information or
// /// actions related to a specific element on the screen. For example, it can be used to
// /// show detailed information about an item in a list or to present actions related to
// /// a specific UI component.
// ///
// /// ## Positioning
// /// The modal is positioned based on the location and size of the anchor widget.
// /// The best anchor alignment is automatically calculated to maximize the available space
// ///
// /// The modal automatically adjusts its size and position to ensure it fits within the
// /// available screen space while respecting the specified alignment relative to the anchor
// /// widget. This behavior ensures that the modal remains accessible and visually connected
// /// to the context it relates to.
// ///
// /// ## Considerations
// /// - The [anchorKey] must be applied to a widget that is already in the widget tree for the
// ///   modal to position itself correctly.
// ///
// /// Created by ABausG (https://github.com/abausg)
// class AttachedFloatingBottomSheetType extends WoltModalType {
//   static const Duration _defaultEnterDuration = Duration(milliseconds: 350);
//   static const Duration _defaultExitDuration = Duration(milliseconds: 300);

//   /// Creates an AttachedFloatingBottomSheetType
//   ///
//   /// [anchorKey] is the key of the widget that the bottom sheet will be attached to. Apply this key to the Widget where the Sheet should be attached to
//   /// [_alignment] is the alignment of the bottom sheet to the anchor. Default is [Alignment.center]
//   ///
//   /// If the anchor is not found, the bottom sheet will be centered on the screen
//   AttachedFloatingBottomSheetType({
//     required GlobalKey anchorKey,
//   }) : super(
//           shapeBorder: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(28.0)),
//           ),
//           showDragHandle: false,
//           dismissDirection: WoltModalDismissDirection.down,
//           transitionDuration: _defaultEnterDuration,
//           reverseTransitionDuration: _defaultExitDuration,
//         ) {
//     final renderBox =
//         anchorKey.currentContext?.findRenderObject() as RenderBox?;
//     _anchorPosition = renderBox?.localToGlobal(Offset.zero);
//     _anchorSize = renderBox?.size;
//   }

//   late final Offset? _anchorPosition;
//   late final Size? _anchorSize;
//   Alignment _alignment = Alignment.center;

//   @override
//   Offset positionModal(
//       Size availableSize, Size modalContentSize, TextDirection textDirection) {
//     final anchorPosition = _anchorPosition;
//     final isOffscreen = anchorPosition == null ||
//         anchorPosition.dx < 0 ||
//         anchorPosition.dx > availableSize.width ||
//         anchorPosition.dy < 0 ||
//         anchorPosition.dy > availableSize.height;
//     if (isOffscreen) {
//       // Return the Center Offset by the size of the modal content
//       // If no position found
//       return availableSize.center(Offset.zero) -
//           Offset(modalContentSize.width, modalContentSize.height) / 2;
//     } else {
//       final modalOffset = Offset(
//         (_alignment.x / 2 + 0.5) * modalContentSize.width,
//         (_alignment.y / 2 + 0.5) * modalContentSize.height,
//       );
//       final anchorSize = _anchorSize ?? Size.zero;

//       final anchorOffset = Offset(
//         (_alignment.x / 2 + 0.5) * anchorSize.width,
//         (_alignment.y / 2 + 0.5) * anchorSize.height,
//       );

//       // Position the Modal based on Anchor Position plus the
//       return anchorPosition + anchorOffset - modalOffset;
//     }
//   }

//   @override
//   String routeLabel(BuildContext context) {
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     return localizations.bottomSheetLabel;
//   }

//   @override
//   BoxConstraints layoutModal(Size availableSize) {
//     const padding = 4.0;

//     // Calculate Available Space based on Anchor Position
//     final double availableWidth;
//     final double availableHeight;
//     final position = _anchorPosition;

//     if (position == null) {
//       availableWidth = availableSize.width;
//       availableHeight = availableSize.height;
//     } else {
//       final anchorCenter =
//           position + (_anchorSize ?? Size.zero).center(Offset.zero);

//       // Calculate alignment to maximize the available space
//       double alignmentX = 0.0;
//       double alignmentY = 0.0;

//       final availableCenter = availableSize.center(Offset.zero);

//       if (anchorCenter.dx < availableCenter.dx) {
//         alignmentX = -1.0;
//       } else if (anchorCenter.dx > availableCenter.dx) {
//         alignmentX = 1.0;
//       }

//       if (anchorCenter.dy < availableCenter.dy) {
//         alignmentY = -1.0;
//       } else if (anchorCenter.dy > availableCenter.dy) {
//         alignmentY = 1.0;
//       }

//       _alignment = Alignment(alignmentX, alignmentY);

//       if (_alignment.x == -1 || _alignment.x == 1) {
//         if (_alignment.x == 1) {
//           // Modal is Left of the Anchor
//           availableWidth = position.dx;
//         } else {
//           // Modal is Right of the Anchor
//           availableWidth = availableSize.width - position.dx;
//         }
//       } else {
//         availableWidth = min(position.dx, availableSize.width - position.dx);
//       }

//       if (_alignment.y == -1 || _alignment.y == 1) {
//         if (_alignment.y == 1) {
//           // Modal is Top of the Anchor
//           availableHeight = position.dy;
//         } else {
//           // Modal is Bottom of the Anchor
//           availableHeight = availableSize.height - position.dy;
//         }
//       } else {
//         availableHeight = min(position.dy, availableSize.height - position.dy);
//       }
//     }

//     final width = min(availableWidth - padding, 312.0);
//     return BoxConstraints(
//       minWidth: width,
//       maxWidth: width,
//       minHeight: 0,
//       maxHeight: min(availableHeight, availableSize.height * 0.8),
//     );
//   }

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     final alphaAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeInOutCubic,
//     ));

//     return FadeTransition(
//       opacity: alphaAnimation,
//       child: child,
//     );
//   }
// }