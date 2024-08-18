import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoSpecifications extends StatelessWidget {
  const BentoSpecifications({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });

  final String title;
  final String imagePath;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Image.asset(
            'assets/images/specifications/$imagePath',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: BentoSpacing.xxxs),
        BentoTextCaptionDF(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: BentoColor.secondary.withOpacity(0.85),
          ),
        ),
      ],
    );
  }
}
