import 'package:flutter/material.dart';
import 'dart:math';

class CurvedEndCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final Color progressColor;
  final Color backgroundColor;
  final Widget? center;

  const CurvedEndCircularProgressIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.percent,
    required this.progressColor,
    required this.backgroundColor,
    this.center,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size.fromRadius(radius),
          painter: CurvedEndCircularPainter(
            lineWidth: lineWidth,
            percent: percent,
            progressColor: progressColor,
            backgroundColor: backgroundColor,
          ),
        ),
        if (center != null) center!,
      ],
    );
  }
}

class CurvedEndCircularPainter extends CustomPainter {
  final double lineWidth;
  final double percent;
  final Color progressColor;
  final Color backgroundColor;

  CurvedEndCircularPainter({
    required this.lineWidth,
    required this.percent,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width / 2, size.height / 2);
    double angle = 2 * pi * percent;

    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = lineWidth;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = lineWidth;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
