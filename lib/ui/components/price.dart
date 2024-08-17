import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoPrice extends StatelessWidget {
  const BentoPrice({
    super.key,
    required this.price,
    required this.discount,
  });

  final double price;
  final double discount;

  @override
  Widget build(BuildContext context) {
    String priceFormatted = price.toStringAsFixed(2);
    String discountFormatted = discount.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BentoTextCaptionDF(
          'Price',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFFBEBEBE),
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BentoTextBodyDF(
              discount != 0 ? '\$$discountFormatted' : '\$$priceFormatted',
              style: TextStyle(
                color: BentoColor.secondary,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: BentoSpacing.xxxxs),
            Visibility(
              visible: discount != 0,
              child: BentoTextCaptionDF(
                '\$$priceFormatted',
                style: TextStyle(
                  fontSize: 10,
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
