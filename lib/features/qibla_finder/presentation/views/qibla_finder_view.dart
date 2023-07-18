import 'package:adhan_dart/adhan_dart.dart';
import 'package:al_noor/features/qibla_finder/presentation/views/widgets/compass_painter.dart';
import 'package:al_noor/features/qibla_finder/presentation/views/widgets/qibla_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class QiblaFinderView extends StatefulWidget {
  const QiblaFinderView({super.key});

  @override
  State<QiblaFinderView> createState() => _QiblaFinderViewState();
}

class _QiblaFinderViewState extends State<QiblaFinderView> {
  double _heading = 0;
  double? _qiblahDirection;
  Coordinates? _coordinates;
  String get _readout => "${_heading.toStringAsFixed(0)}°";
  bool showCorrectQiblaDirectionMessage = false;

  final TextStyle _style = const TextStyle(
    color: Color(0xFFe9c46a),
    fontSize: 32,
    fontWeight: FontWeight.w200,
  );

  @override
  void initState() {
    _getPermission();
    super.initState();
  }

  void _getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        print("'Location permissions are permanently denied");
      } else {
        print("GPS Location service is granted");
        _getCurrentPosition();
        setState(() {});
      }
    } else {
      _getCurrentPosition();
    }
  }

  void _getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _coordinates = Coordinates(position.latitude, position.longitude);
    _qiblahDirection = Qibla.qibla(_coordinates);
    print(_qiblahDirection);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          if (_qiblahDirection != null) {
            showCorrectQiblaDirectionMessage =
                _heading.toInt() == _qiblahDirection!.toInt();
          }

          // _heading = 0;
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _qiblahDirection != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Qibla direction for your current location: ${_qiblahDirection!.toStringAsFixed(0)}°",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Stack(
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
                      _qiblahDirection != null
                          ? QiblaCircle(
                              heading: _heading,
                              qiblaDirection: _qiblahDirection!,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: showCorrectQiblaDirectionMessage != false
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Text(
                            'This is the correct Qibla direction!',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFe9c46a),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        });
  }
}
