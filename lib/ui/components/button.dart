import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoButton extends StatelessWidget {
  const BentoButton({
    super.key,
    required this.title,
    this.height = 45,
    this.width = double.maxFinite,
    this.borderRadius = 90,
    this.fontsize = 14,
    this.invertBackgroundColor = false,
    required this.onPressed,
  });

  final String title;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontsize;
  final bool? invertBackgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: !invertBackgroundColor! ? BentoColor.primary : BentoColor.secondary,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(
          child: BentoTextCaptionDF(
            title,
            style: TextStyle(
              fontSize: fontsize,
              color: !invertBackgroundColor! ? BentoColor.secondary : BentoColor.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
