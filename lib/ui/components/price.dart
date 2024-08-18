import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoPrice extends StatelessWidget {
  const BentoPrice({
    super.key,
    required this.price,
    required this.discount,
    this.fontsizeTitle = 10,
    this.fontsizePrice = 16,
    this.fontsizeDiscount = 10,
  });

  final double price;
  final double discount;
  final double? fontsizeTitle;
  final double? fontsizePrice;
  final double? fontsizeDiscount;

  @override
  Widget build(BuildContext context) {
    String priceFormatted = price.toStringAsFixed(2);
    String discountFormatted = discount.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BentoTextCaptionDF(
          'Price',
          style: TextStyle(
            fontSize: fontsizeTitle,
            color: Color(0xFFBBBBBB),
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BentoTextBodyDF(
              discount > 0 ? '\$$discountFormatted' : '\$$priceFormatted',
              style: TextStyle(
                fontSize: fontsizePrice,
                color: BentoColor.secondary,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: BentoSpacing.xxxs),
            Visibility(
              visible: discount > 0,
              child: BentoTextCaptionDF(
                '\$$priceFormatted',
                style: TextStyle(
                  fontSize: fontsizeDiscount,
                  color: Color(0xFFC8D0D9),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
