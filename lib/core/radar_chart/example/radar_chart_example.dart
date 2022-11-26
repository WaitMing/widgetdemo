import 'package:flutter/material.dart';
import 'package:widgetdemo/core/radar_chart/model/data/radar_chart_data.dart';
import 'package:widgetdemo/core/radar_chart/model/radar_chart.dart';
import 'package:widgetdemo/core/radar_chart/view/radar_chart_widget.dart';

// NOTE: I recommend creating a separate screen for each widget for example,
// so it will be easier to develop and test.
// The bottom line is that we went from the smallest parts and gradually came to the widget.
// We have all the data on hand.
// So it's easier to concentrate on visualization and not think about logic.
class RadarChartExample extends StatelessWidget {
  final RadarChart radarChart = RadarChart(
    minimum: 0,
    maximum: 10,
    listRadarChartData: [
      RadarChartData(
        name: 'temperature',
        value: 2,
      ),
      RadarChartData(
        name: 'wind speed',
        value: 5,
      ),
      RadarChartData(
        name: 'some kind of power',
        value: 10,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RadarChartWidget(radarChart: radarChart),
    );
  }
}
