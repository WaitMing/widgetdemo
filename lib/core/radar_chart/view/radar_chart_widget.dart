import 'package:flutter/material.dart';
import 'package:widgetdemo/core/radar_chart/model/radar_chart.dart';

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
    );
  }
}
