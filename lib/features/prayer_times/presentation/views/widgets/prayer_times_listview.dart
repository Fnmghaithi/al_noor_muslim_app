import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayerTimesListView extends StatelessWidget {
  const PrayerTimesListView({super.key});
  final List<String> prayerTimesNames = const [
    'Fajr',
    'Sunrise',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 6,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ListTile(
              leading: Image(
                image: AssetImage(
                    "images/${prayerTimesNames[index].toLowerCase()}-light.png"),
              ),
              title: Text(
                prayerTimesNames[index],
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              trailing: Text(
                '4:01 AM',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
