part of '../landing_page.dart';

class AppColors {
  static const Color contentColorBlue = Color(0xff0293ee);
  static const Color contentColorYellow = Color(0xfff8b250);
  static const Color contentColorPurple = Color(0xff845bef);
  static const Color contentColorGreen = Color(0xff13d38e);
  static const Color contentColorBlack = Color(0xff000000);

  static var contentColorRed = const Color(0xffe74c3c);

  static var contentColorCyan = const Color(0xff00bcd4);

  static var contentColorWhite = const Color(0xffFFFFFF);

  static var mainTextColor2 = const Color(0xffb6b8c4);

  static var mainTextColor1 = const Color(0xffb6b8c4);

  static var pageBackground = const Color(0xff1e1e30);
}

class _ReginalProgressCard extends StatefulWidget {
  const _ReginalProgressCard();

  @override
  State<StatefulWidget> createState() => _ReginalProgressCardState();
}

class _ReginalProgressCardState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText('Total Users'),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            ],
          ),
          LayoutBuilder(builder: (context, bound) {
            return AspectRatio(
              aspectRatio: 1.3,
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 1,
                    centerSpaceRadius: 10,
                    sections: showingSections(bound),
                  ),
                ),
              ),
            );
          }).expand(),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(BoxConstraints bound) {
    double w = bound.maxWidth;
    double h = bound.maxHeight;
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? h * 0.09 : h * 0.07;
      final radius = isTouched ? w * 0.22 : w * 0.2;
      final widgetSize = isTouched ? h * 0.15 : h * 0.1;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              SvgConst.worker,
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              SvgConst.worker,
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              SvgConst.worker,
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              SvgConst.worker,
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
