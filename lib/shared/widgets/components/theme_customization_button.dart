import 'package:admin/core/theme/index.dart';
import 'package:admin/shared/extensions/index.dart';
import 'package:admin/shared/widgets/components/modals/type/floating_bottom_sheet_type.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../core/routes/index.dart';
import '../animated_rotating_widget.dart';

class ThemeCustomizationButton extends StatelessWidget {
  const ThemeCustomizationButton({super.key});

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
              color:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ]),
      child: IconButton(
        onPressed: _showCustomizationDialogDialog,
        icon: const AnimatedRotatingWidget(
            child: Icon(Icons.settings, color: Colors.white)),
      ),
    ).tip("Customize Theme");
  }

  void _showCustomizationDialogDialog() {
    WoltModalSheet.show(
      context: AppRouter.context!,
      modalTypeBuilder: (context) => FloatingBottomSheetType(
        radius: context.read<CustomizasionThemeExt>().radius,
      ),
      // .copyWith(shapeBorder: const BeveledRectangleBorder()),
      pageListBuilder: (context) => [
        SliverWoltModalSheetPage(
            hasTopBarLayer: false,
            mainContentSliversBuilder: (context) {
              return [
                SliverToBoxAdapter(
                  child: StatefulBuilder(builder: (context, setState) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleText("Customize Theme"),
                          const SizedBox(height: 16),

                          /// Dark Mode Switch
                          Row(
                            children: [
                              const Text("Dark Mode"),
                              const Spacer(),
                              Switch(
                                value: context.isDark,
                                onChanged: (value) {
                                  context.customizationThemeExt
                                      .toogleThemeMode();
                                },
                              ),
                            ],
                          ),

                          /// slider for border radious
                          const Text("Border Radius"),
                          Slider(
                            value:
                                context.watch<CustomizasionThemeExt>().radius,
                            onChanged: (value) {
                              context
                                  .read<CustomizasionThemeExt>()
                                  .updateRadius(value);
                              // setState(() {});
                            },
                            min: 0,
                            max: 50,
                          ),
                        ],
                      ),
                    );
                  }),
                )
              ];
            }),
      ],
    );
  }
}
