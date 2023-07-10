import 'package:flutter/material.dart';

class CustomBottomAppBarButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final void Function()? onPressed;
  const CustomBottomAppBarButton({
    super.key,
    this.isSelected = false,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFe9c46a) : Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
