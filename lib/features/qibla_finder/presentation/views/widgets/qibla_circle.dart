import 'dart:math';

import 'package:flutter/material.dart';

class QiblaCircle extends StatelessWidget {
  final double heading;
  const QiblaCircle({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // color: Colors.red,
      ),
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -2 * pi * (heading / 360),
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.rotationZ(262 * pi / 180),
          origin: Offset.zero,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 35,
              width: 35,
              child: Image.asset('images/kaaba-icon.png'),
            ),
          ),
        ),
      ),
    );
  }
}
