import 'package:al_noor/core/bloc/bottom_navigation_bar_bloc.dart';
import 'package:al_noor/core/widgets/compass_floating_action_button.dart';
import 'package:al_noor/core/widgets/custom_bottom_app_bar.dart';
import 'package:al_noor/features/holy_quran/presentation/views/holy_quran_view.dart';
import 'package:al_noor/features/mosque_locations/presentation/views/mosque_locations_view.dart';
import 'package:al_noor/features/prayer_times/presentation/views/prayer_times_view.dart';
import 'package:al_noor/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Widget> views = const [
    PrayerTimesView(),
    MosqueLocationsView(),
    HolyQuranView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          if (state is IndexChangedState) {
            return Scaffold(
              floatingActionButton: const CompassFloatingActionButton(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomBottomAppBar(
                currentIndex: state.index,
              ),
              body: views[state.index],
            );
          }
          return Scaffold(
            floatingActionButton: const CompassFloatingActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomAppBar(
              currentIndex: 0,
            ),
            body: views[0],
          );
        },
      ),
    );
  }
}
