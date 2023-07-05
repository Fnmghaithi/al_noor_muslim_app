import 'package:al_noor/core/widgets/compass_floating_action_button.dart';
import 'package:al_noor/core/widgets/custom_bottom_app_bar.dart';
import 'package:al_noor/features/prayer_times/presentation/views/widgets/custom_progress_indicator.dart';
import 'package:al_noor/features/prayer_times/presentation/views/widgets/greeting_widget.dart';
import 'package:al_noor/features/prayer_times/presentation/views/widgets/prayer_times_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CompassFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Column(
        children: [
          Expanded(
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
          ),
          const PrayerTimesSection(),
        ],
      ),
    );
  }
}
