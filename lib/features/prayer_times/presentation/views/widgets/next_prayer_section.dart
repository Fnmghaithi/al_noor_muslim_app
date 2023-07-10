import 'package:al_noor/features/prayer_times/presentation/views/widgets/custom_progress_indicator.dart';
import 'package:al_noor/features/prayer_times/presentation/views/widgets/greeting_widget.dart';
import 'package:flutter/material.dart';

class NextPrayerSection extends StatelessWidget {
  const NextPrayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage('images/background.png'),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: SafeArea(
            child: Column(
              children: const [
                GreetingWidget(),
                CustomProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
