import 'package:widgetdemo/core/radar_chart/model/data/radar_chart_data.dart';

class RadarChart<T> {
  final T minimum;
  final T maximum;
  
  final List<RadarChartData> listRadarChartData;

  RadarChart({
    required this.minimum,
    required this.maximum,
    required this.listRadarChartData,
  });
}
