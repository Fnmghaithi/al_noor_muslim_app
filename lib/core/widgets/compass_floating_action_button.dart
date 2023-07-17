import 'package:al_noor/core/utils/app_color.dart';
import 'package:al_noor/features/qibla_finder/presentation/views/qibla_finder_view.dart';
import 'package:flutter/material.dart';

class CompassFloatingActionButton extends StatelessWidget {
  const CompassFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: size,
              child: const QiblaFinderView(),
            );
          },
        );
      },
      child: const Icon(Icons.explore),
    );
  }
}
