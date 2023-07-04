import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                canScaleToFit: true,
                startAngle: 150,
                endAngle: 30,
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.white.withOpacity(0.25),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: const <GaugePointer>[
                  RangePointer(
                    color: Color(0xFFe9c46a),
                    value: 70,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next Prayer In',
                          style: GoogleFonts.roboto(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '14:00',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
