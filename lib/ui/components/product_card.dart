import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';
import 'package:flutter/material.dart';

class BentoProductCard extends StatelessWidget {
  const BentoProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;

    return Container(
      width: widthScreen * 0.45,
      decoration: BoxDecoration(
        color: Color(0xFFFAF0DC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: BentoColor.yellow,
                  size: 16,
                ),
                SizedBox(width: 2),
                BentoTextCaptionDF(
                  '4.5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: BentoColor.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/products/orange.png',
              fit: BoxFit.contain,
              width: 120,
              height: 120,
            ),
            SizedBox(height: BentoSpacing.sm),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
