import 'package:flutter/material.dart';

class BentoIconButton extends StatelessWidget {
  const BentoIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.iconColor,
    required this.backgroundColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
