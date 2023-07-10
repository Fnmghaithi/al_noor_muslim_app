import 'package:al_noor/features/prayer_times/presentation/views/widgets/next_prayer_section.dart';
import 'package:al_noor/features/prayer_times/presentation/views/widgets/prayer_times_section.dart';
import 'package:flutter/material.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NextPrayerSection(),
        PrayerTimesSection(),
      ],
    );
  }
}
