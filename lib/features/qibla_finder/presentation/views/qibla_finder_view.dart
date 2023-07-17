import 'package:al_noor/features/qibla_finder/presentation/views/widgets/compass_painter.dart';
import 'package:al_noor/features/qibla_finder/presentation/views/widgets/qibla_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class QiblaFinderView extends StatefulWidget {
  const QiblaFinderView({super.key});

  @override
  State<QiblaFinderView> createState() => _QiblaFinderViewState();
}

class _QiblaFinderViewState extends State<QiblaFinderView> {
  double _heading = 0;
  String get _readout => "${_heading.toStringAsFixed(0)}°";

  final TextStyle _style = const TextStyle(
    color: Color(0xFFe9c46a),
    fontSize: 32,
    fontWeight: FontWeight.w200,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error reading heading: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          _heading = snapshot.data!.heading!;
          return Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: CompassPainter(angle: _heading),
                child: Center(
                  child: Text(
                    _readout,
                    style: _style,
                  ),
                ),
              ),
              QiblaCircle(heading: _heading),
            ],
          );
        });
  }
}
