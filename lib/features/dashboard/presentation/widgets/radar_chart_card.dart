part of '../landing_page.dart';

extension _ColorExt on Color {
  Color lighten([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final factor = percent / 100;
    final r = (red + (255 - red) * factor).round();
    final g = (green + (255 - green) * factor).round();
    final b = (blue + (255 - blue) * factor).round();
    return Color.fromARGB(alpha, r, g, b);
  }
}

class _RadarChartSample1 extends StatefulWidget {
  _RadarChartSample1({super.key});

  final gridColor = AppColors.contentColorPurple.lighten(80);
  final titleColor = AppColors.contentColorPurple.lighten(80);
  final fashionColor = AppColors.contentColorRed;
  final artColor = AppColors.contentColorCyan;
  final boxingColor = AppColors.contentColorGreen;
  final entertainmentColor = AppColors.contentColorWhite;
  final offRoadColor = AppColors.contentColorYellow;

  @override
  State<_RadarChartSample1> createState() => _RadarChartSample1State();
}

class _RadarChartSample1State extends State<_RadarChartSample1> {
  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = true;
  @override
  void setState(VoidCallback fn) {
    if (context.mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText('Radar Data'),
          GestureDetector(
            onTap: () {
              selectedDataSetIndex = -1;
              setState(() {});
            },
            child: Text(
              'Categories'.toUpperCase(),
              style: context.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 4),
          _buildCategories(),
          const SizedBox(height: 30),
          RadarChart(
            RadarChartData(
              radarTouchData: RadarTouchData(
                touchCallback: (FlTouchEvent event, response) {
                  if (!event.isInterestedForInteractions) {
                    setState(() {
                      selectedDataSetIndex = -1;
                    });
                    return;
                  }
                  setState(() {
                    selectedDataSetIndex =
                        response?.touchedSpot?.touchedDataSetIndex ?? -1;
                  });
                },
              ),
              dataSets: showingDataSets(),
              radarBackgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),
              radarBorderData: const BorderSide(color: Colors.transparent),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle: TextStyle(
                  color: context.textTheme.bodyLarge?.color, fontSize: 14),
              getTitle: (index, angle) {
                final usedAngle =
                    relativeAngleMode ? angle + angleValue : angleValue;
                switch (index) {
                  case 0:
                    return RadarChartTitle(
                      text: 'Mobile or Tablet',
                      angle: usedAngle,
                    );
                  case 2:
                    return RadarChartTitle(
                      text: 'Desktop',
                      angle: usedAngle,
                    );
                  case 1:
                    return RadarChartTitle(text: 'TV', angle: usedAngle);
                  default:
                    return const RadarChartTitle(text: '');
                }
              },
              tickCount: 1,
              ticksTextStyle:
                  const TextStyle(color: Colors.transparent, fontSize: 10),
              tickBorderData: const BorderSide(color: Colors.transparent),
              gridBorderData: BorderSide(color: widget.gridColor, width: 2),
            ),
            swapAnimationDuration: const Duration(milliseconds: 400),
          ).expand(),
        ],
      ),
    );
  }

  Wrap _buildCategories() {
    return Wrap(
      children: rawDataSets()
          .asMap()
          .map((index, value) {
            final isSelected = index == selectedDataSetIndex;
            return MapEntry(
              index,
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDataSetIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 26,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.pageBackground
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(46),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInToLinear,
                        padding: EdgeInsets.all(isSelected ? 8 : 6),
                        decoration: BoxDecoration(
                          color: value.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInToLinear,
                        style: TextStyle(
                            color: isSelected
                                ? value.color
                                : context.textTheme.bodyLarge?.color),
                        child: Text(value.title),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
          .values
          .toList(),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: widget.fashionColor,
        values: [
          300,
          50,
          250,
        ],
      ),
      RawDataSet(
        title: 'Art & Tech',
        color: widget.artColor,
        values: [
          250,
          100,
          200,
        ],
      ),
      RawDataSet(
        title: 'Entertainment',
        color: widget.entertainmentColor,
        values: [
          200,
          150,
          50,
        ],
      ),
      RawDataSet(
        title: 'Off-road Vehicle',
        color: widget.offRoadColor,
        values: [
          150,
          200,
          150,
        ],
      ),
      RawDataSet(
        title: 'Boxing',
        color: widget.boxingColor,
        values: [
          100,
          250,
          100,
        ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
