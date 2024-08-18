import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';

class BentoIconButton extends StatelessWidget {
  const BentoIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: BentoColor.grey,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Icon(
          icon,
          color: BentoColor.secondary,
        ),
      ),
    );
  }
}
