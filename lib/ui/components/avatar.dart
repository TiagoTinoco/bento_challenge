import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';

class BentoAvatar extends StatelessWidget {
  const BentoAvatar({
    super.key,
    required this.imagePath,
    this.radius = 20.0,
    this.onPressed,
  });

  final String imagePath;
  final double radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: radius * 2,
          width: radius * 3.7,
          decoration: BoxDecoration(color: BentoColor.primary.shade300),
          child: Align(
            child: Padding(
              padding: EdgeInsets.only(
                top: 4,
                left: 9,
                right: 6,
                bottom: 6,
              ),
              child: Image.asset(
                'assets/images/$imagePath',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
