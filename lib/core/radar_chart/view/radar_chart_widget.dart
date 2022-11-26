import 'package:flutter/material.dart';
import 'package:widgetdemo/core/radar_chart/model/radar_chart.dart';
import 'package:widgetdemo/core/radar_chart/view/radar_chart_data_widget.dart';

class RadarChartWidget<T> extends StatelessWidget {
  const RadarChartWidget({
    required this.radarChart,
  });

  final RadarChart<T> radarChart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      color: Colors.green,
      child: Builder(builder: (context) {
        // Not very effective, but it will help you get to the result faster, we will fix it later.
        // In the future, you can cache widgets or initially use an array of widgets.

        int shift = 360 ~/ radarChart.listRadarChartData.length;

        int angle = -shift;

        final widgets = radarChart.listRadarChartData.map(
          (data) {
            angle += shift;

            return RadarChartDataWidget(
              radarChartData: data,
              angle: angle,
            );
          },
        ).toList();

        return Stack(
          children: widgets,
        );
      }),
    );
  }
}
