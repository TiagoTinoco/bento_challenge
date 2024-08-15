import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoButton extends StatelessWidget {
  const BentoButton({
    super.key,
    required this.title,
    this.height = 45,
    this.width = double.maxFinite,
    required this.invertBackgroundColor,
    required this.onPressed,
  });

  final String title;
  final double? height;
  final double? width;
  final bool invertBackgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 18,
          ),
          backgroundColor: !invertBackgroundColor ? BentoColor.primary : BentoColor.secondary,
        ),
        child: BentoTextCaptionDF(
          title,
          style: TextStyle(
            color: !invertBackgroundColor ? BentoColor.secondary : BentoColor.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
