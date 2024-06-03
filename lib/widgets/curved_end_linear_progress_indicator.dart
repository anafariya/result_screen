import 'package:flutter/material.dart';

class CurvedEndLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final Color backgroundColor;
  final double height;

  CurvedEndLinearProgressIndicator({
    required this.value,
    required this.color,
    this.backgroundColor = Colors.grey,
    this.height = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CurvedEndLinearProgressPainter(
        value: value,
        color: color,
        backgroundColor: backgroundColor,
        height: height,
      ),
      child: Container(
        height: height,
      ),
    );
  }
}

class _CurvedEndLinearProgressPainter extends CustomPainter {
  final double value;
  final Color color;
  final Color backgroundColor;
  final double height;

  _CurvedEndLinearProgressPainter({
    required this.value,
    required this.color,
    required this.backgroundColor,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final Paint foregroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double width = size.width * value;
    final double radius = height / 2;

    // Draw the background
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, height),
        Radius.circular(radius),
      ),
      backgroundPaint,
    );

    // Draw the foreground
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, width, height),
        Radius.circular(radius),
      ),
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
