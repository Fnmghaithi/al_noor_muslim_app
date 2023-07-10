import 'package:al_noor/core/bloc/bottom_navigation_bar_bloc.dart';
import 'package:al_noor/core/widgets/custom_bottom_app_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;

  CustomBottomAppBar({super.key, required this.currentIndex});

  final List<IconData> unselectedIcons = [
    Icons.dashboard_outlined,
    Icons.mosque_outlined,
    Icons.import_contacts_outlined,
    Icons.settings_outlined,
  ];

  final List<IconData> selectedIcons = [
    Icons.dashboard,
    Icons.mosque,
    Icons.import_contacts,
    Icons.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBottomAppBarButton(
                  isSelected: currentIndex == 0,
                  icon:
                      currentIndex == 0 ? selectedIcons[0] : unselectedIcons[0],
                  onPressed: () {
                    BlocProvider.of<BottomNavigationBarBloc>(context)
                        .add(IndexChangeEvent(index: 0));
                  },
                ),
                CustomBottomAppBarButton(
                  isSelected: currentIndex == 1,
                  icon:
                      currentIndex == 1 ? selectedIcons[1] : unselectedIcons[1],
                  onPressed: () {
                    BlocProvider.of<BottomNavigationBarBloc>(context)
                        .add(IndexChangeEvent(index: 1));
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomBottomAppBarButton(
                  isSelected: currentIndex == 2,
                  icon:
                      currentIndex == 2 ? selectedIcons[2] : unselectedIcons[2],
                  onPressed: () {
                    BlocProvider.of<BottomNavigationBarBloc>(context)
                        .add(IndexChangeEvent(index: 2));
                  },
                ),
                CustomBottomAppBarButton(
                  isSelected: currentIndex == 3,
                  icon:
                      currentIndex == 3 ? selectedIcons[3] : unselectedIcons[3],
                  onPressed: () {
                    BlocProvider.of<BottomNavigationBarBloc>(context)
                        .add(IndexChangeEvent(index: 3));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
