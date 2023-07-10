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
    return Expanded(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          height: 4,
        ),
        itemCount: 6,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
            ),
            child: Container(
              // height: 60,
              padding: EdgeInsets.zero,
              // color: Colors.red,
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFe9c46a).withOpacity(0.2),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image(
                    image: AssetImage(
                        "images/${prayerTimesNames[index].toLowerCase()}.png"),
                  ),
                ),
                title: Text(
                  prayerTimesNames[index],
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  '4:01 AM',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
