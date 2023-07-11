import 'package:al_noor/features/qibla_finder/presentation/views/widgets/qibla_finder_view_painter.dart';
import 'package:flutter/material.dart';

class QiblaFinderView extends StatefulWidget {
  const QiblaFinderView({super.key});

  @override
  State<QiblaFinderView> createState() => _QiblaFinderViewState();
}

class _QiblaFinderViewState extends State<QiblaFinderView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: CustomPaint(
        size: size,
        painter: QiblaFinderViewPainter(
          color: Colors.grey,
        ),
      ),
    );
  }
}
