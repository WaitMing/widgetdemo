import 'dart:math';

import 'package:flutter/material.dart';
import 'package:superdeclarative_geometry/superdeclarative_geometry.dart';
import 'package:widgetdemo/core/radar_chart/model/data/radar_chart_data.dart';

class RadarChartDataWidget extends StatelessWidget {
  RadarChartDataWidget({
    required this.radarChartData,
    required this.angle,
  }) {
    final Point point = PolarCoord(100, Angle.fromDegrees(angle)).toCartesian();

    // FIXME: Initially use double to avoid errors.
    offset = Offset(point.x.toDouble() + 200, point.y.toDouble() + 200);
  }

  final RadarChartData radarChartData;
  final int angle;

  late Offset offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: ClipOval(
        child: Container(
          width: 15,
          height: 15,
          color: Colors.red,
        ),
      ),
    );
  }
}
