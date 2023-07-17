import 'dart:math';

import 'package:flutter/material.dart';

class CompassPainter extends CustomPainter {
  final double angle;
  double get rotation => -2 * pi * (angle / 360);

  CompassPainter({required this.angle});

  Paint get _brush => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 24.0;

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = _brush..color = const Color(0xFFe9c46a);

    Paint needle = _brush
      ..color = Colors.red[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    double radius = min(size.width / 3.2, size.height / 3.2);
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset start = Offset.lerp(Offset(center.dx, radius), center, .4)!;
    Offset end = Offset.lerp(Offset(center.dx, radius), center, 0.1)!;

    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawCircle(center, radius, circle);

    canvas.drawLine(start, end, needle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
