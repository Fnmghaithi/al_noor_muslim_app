import 'package:al_noor/features/prayer_times/presentation/views/widgets/prayer_times_listview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayerTimesSection extends StatelessWidget {
  const PrayerTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: const Color(0xFFe9c46a),
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 32.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Prayer Times',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const PrayerTimesListView(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
