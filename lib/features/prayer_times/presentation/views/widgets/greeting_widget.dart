import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Afternoon',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Dhu al-Hijjah 15, 1444 | Monday, July 3, 2023',
              style: GoogleFonts.roboto(
                color: Colors.white.withOpacity(0.9),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
