import 'dart:math';

import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  ArrowPainter({
    required this.arrowStart,
    required this.arrowEnd,
    this.color = Colors.white,
  });

  final Offset arrowStart;
  final Offset arrowEnd;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) => canvas.drawArrow(arrowStart, arrowEnd, color);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

///
/// Draws shapes
///
extension ArrowDrawing on Canvas {
  num _abs(num val) {
    return val > 0 ? val : -val;
  }

  ///
  /// BASED OFF https://www.codeproject.com/Questions/125049/Draw-an-arrow-with-big-cap
  ///
  void drawArrow(Offset arrowStart, Offset arrowEnd, Color color, {Paint? painter, double? width}) {
    final arrowMultiplier = width ?? 3;

    //tip of the arrow
    final Offset arrowPoint = arrowEnd;

    //determine arrow length
    final double arrowLength = sqrt(pow(_abs(arrowStart.dx - arrowEnd.dx), 2) + pow(_abs(arrowStart.dy - arrowEnd.dy), 2));

    //determine arrow angle
    final double arrowAngle = atan2(_abs(arrowStart.dy - arrowEnd.dy), _abs(arrowStart.dx - arrowEnd.dx));

    //get the x,y of the back of the point

    //to change from an arrow to a diamond, change the 3
    //in the next if/else blocks to 6

    double pointX;
    double pointY;

    if (arrowStart.dx > arrowEnd.dx) {
      pointX = arrowStart.dx - (cos(arrowAngle) * (arrowLength - (3 * arrowMultiplier)));
    } else {
      pointX = cos(arrowAngle) * (arrowLength - (3 * arrowMultiplier)) + arrowStart.dx;
    }

    if (arrowStart.dy > arrowEnd.dy) {
      pointY = arrowStart.dy - (sin(arrowAngle) * (arrowLength - (3 * arrowMultiplier)));
    } else {
      pointY = (sin(arrowAngle) * (arrowLength - (3 * arrowMultiplier))) + arrowStart.dy;
    }

    final Offset arrowPointBack = Offset(pointX, pointY);

    //get the secondary angle of the left tip
    final double angleB = atan2(3 * arrowMultiplier, arrowLength - (3 * arrowMultiplier));

    double angleC = pi * (90 - (arrowAngle * (180 / pi)) - (angleB * (180 / pi))) / 180;

    //get the secondary length
    final double secondaryLength = (3 * arrowMultiplier) / sin(angleB);

    if (arrowStart.dx > arrowEnd.dx) {
      pointX = arrowStart.dx - (sin(angleC) * secondaryLength);
    } else {
      pointX = (sin(angleC) * secondaryLength) + arrowStart.dx;
    }

    if (arrowStart.dy > arrowEnd.dy) {
      pointY = arrowStart.dy - (cos(angleC) * secondaryLength);
    } else {
      pointY = (cos(angleC) * secondaryLength) + arrowStart.dy;
    }

    //get the left point
    final Offset arrowPointLeft = Offset(pointX, pointY);

    //move to the right point
    angleC = arrowAngle - angleB;

    if (arrowStart.dx > arrowEnd.dx) {
      pointX = arrowStart.dx - (cos(angleC) * secondaryLength);
    } else {
      pointX = (cos(angleC) * secondaryLength) + arrowStart.dx;
    }

    if (arrowStart.dy > arrowEnd.dy) {
      pointY = arrowStart.dy - (sin(angleC) * secondaryLength);
    } else {
      pointY = (sin(angleC) * secondaryLength) + arrowStart.dy;
    }

    final Offset arrowPointRight = Offset(pointX, pointY);

    //create the point list
    final List<Offset> arrowPoints = [arrowPoint, arrowPointLeft, arrowPointBack, arrowPointRight];
    // todo: remove
    final Path arrowPath = Path()..addPolygon(arrowPoints, true);

    //define paint
    final Paint paint = painter ?? Paint();
    // paint.shader = LinearGradient(
    //   colors: [
    //     Colors.red,
    //     color,
    //   ],
    // ).createShader(
    //   Rect.fromCenter(center: Offset(1, 1), width: 20, height: 20),
    // );

    paint.color = color;
    //draw
    drawPath(arrowPath, paint);
    drawLine(arrowStart, arrowPointBack, paint..strokeWidth = arrowMultiplier * 1);
  }
}
