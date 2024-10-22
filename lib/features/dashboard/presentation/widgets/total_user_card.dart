part of '../landing_page.dart';

class _TotalUsersCard extends StatelessWidget {
  _TotalUsersCard({super.key});
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, bound) {
      return MainCard(
        elevation: 0,
        padding: bound.maxWidth * 0.01,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleText(
                  'Total Users (5667)',
                  // style: context.textTheme.bodyMedium
                  //     ?.copyWith(fontWeight: FontWeight.bold),
                ).expand(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded)),
              ],
            ),
            LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) => Colors.grey[300]!),
                ),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      // reservedSize: context.textTheme.bodyLarge?.fontSize ?? 20,
                      interval: 3,
                      getTitlesWidget: (v, meta) =>
                          bottomTitleWidgets(v, meta, bound),
                    ),
                    // drawBelowEverything: false
                    // axisNameWidget: Text(
                    //   'Month',
                    //   style: context.textTheme.bodySmall,
                    // ),
                  ),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(
                    sideTitles: const SideTitles(showTitles: false),
                    axisNameSize: bound.maxHeight * 0.3,
                    axisNameWidget: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ).paddingOnly(bottom: 10),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: leftTitleWidgets,
                      showTitles: true,
                      interval: 2,
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false, border: Border.all()),
                lineBarsData: [
                  chart1Data(context, bound),
                  chart2Data(context, bound)
                ],
                maxX: months.length.toDouble() + 2,
                maxY: 4,
                minX: 0,
                minY: 0,
              ),
              duration: const Duration(milliseconds: 300), // Optional
              curve: Curves.linear, // Optional
            ).expand(),
          ],
        ),
      );
    });
  }

  LineChartBarData chart2Data(BuildContext context, BoxConstraints bound) {
    return LineChartBarData(
      isCurved: true,
      color: context.theme.colorScheme.primary,
      barWidth: bound.maxWidth * 0.012,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        color: context.theme.colorScheme.secondary.withOpacity(0.3),
      ),
      spots: List.generate(months.length, (index) {
        return FlSpot(index.toDouble() * 3 + 1,
            (Random().nextDouble() * 6).toStringAsFixed(2).toDouble());
      }),
    );
  }

  LineChartBarData chart1Data(BuildContext context, BoxConstraints bound) {
    return LineChartBarData(
      isCurved: true,
      color: context.theme.colorScheme.secondary,
      barWidth: bound.maxWidth * 0.012,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
          show: false,
          gradient: RadialGradient(colors: [
            context.theme.colorScheme.secondary.withOpacity(0.2),
            context.theme.colorScheme.secondary.withOpacity(0.7),
          ])),
      spots: List.generate(months.length, (index) {
        return FlSpot(index.toDouble() * 3 + 1,
            (Random().nextDouble() * 6).toStringAsFixed(2).toDouble());
      }),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = AppRouter.context!.textTheme.bodySmall;
    String text = "${value.toInt()}m";

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  Widget bottomTitleWidgets(
      double value, TitleMeta meta, BoxConstraints bound) {
    TextStyle? style = AppRouter.context!.textTheme.bodySmall?.copyWith(
      fontSize: bound.maxWidth * 0.04,
    );
    String _text = '';
    switch (value.toInt()) {
      case 1:
        _text = 'Jan';
        break;
      case 2:
        _text = 'Feb';
        break;
      case 3:
        _text = 'Mar';
        break;
      case 4:
        _text = 'Apr';
        break;
      case 5:
        _text = 'May';
        break;
      case 6:
        _text = 'Jun';
        break;
      case 7:
        _text = 'Jul';
        break;
      case 8:
        _text = 'Aug';
        break;
      case 9:
        _text = 'Sep';
        break;
      case 10:
        _text = 'Oct';
        break;
      case 11:
        _text = 'Nov';
        break;
      case 12:
        _text = 'Dec';
        break;
    }

    Widget text = Text(_text, style: style, textAlign: TextAlign.center);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      angle: 0,
      fitInside: SideTitleFitInsideData(
        enabled: true,
        axisPosition: 0,
        parentAxisSize: bound.maxWidth,
        distanceFromEdge: 0,
      ),
      child: text,
    );
  }
}
