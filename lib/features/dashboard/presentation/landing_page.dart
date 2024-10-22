import 'dart:math';

import 'package:admin/core/constants/assets_const.dart';
import 'package:admin/core/routes/index.dart';
import 'package:admin/core/theme/index.dart';
import 'package:admin/shared/extensions/index.dart';
import 'package:ext_plus/ext_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part './widgets/total_user_card.dart';
part './widgets/reginal_pregress_card.dart';
part './widgets/radar_chart_card.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          padding:
              EdgeInsetsDirectional.all(context.customizationThemeExt.radius),
          children: [
            GridView.extent(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 450,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: [
                _TotalUsersCard(),
                const _ReginalProgressCard(),
                _TotalUsersCard(),
              ],
            ),
            10.height,
            LayoutBuilder(
              builder: (context, b) {
                return GridView.custom(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 700,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: b.maxWidth > 500 ? 1.3 : 1,
                  ),
                  childrenDelegate: SliverChildListDelegate.fixed([
                    _RadarChartSample1(),
                    // _RadarChartSample1(),
                    _TotalUsersCard(),
                  ]),
                );
              },
            ),
          ],
        ),
    );
  }
}
