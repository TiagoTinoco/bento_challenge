import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';
import 'package:flutter/material.dart';

class BentoCategory extends StatefulWidget {
  const BentoCategory({super.key});

  @override
  State<BentoCategory> createState() => _BentoCategoryState();
}

class _BentoCategoryState extends State<BentoCategory> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => {
            setState(() => _isTapped = !_isTapped),
          },
          child: Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: !_isTapped ? Color(0xFFF5F5F5) : BentoColor.primary.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/categories/vegan.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: BentoSpacing.xxs / 2),
        BentoTextCaptionDF(
          'Vegan',
          style: TextStyle(
            color: BentoColor.secondary,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
