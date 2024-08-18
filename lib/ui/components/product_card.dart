import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

import 'package:bento_challenge/ui/components/button.dart';
import 'package:bento_challenge/ui/components/price.dart';

class BentoProductCard extends StatelessWidget {
  const BentoProductCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.stars,
    required this.onPressed,
    this.discount = 0,
    this.backgroundColor = const Color(0xFFF5F5F5),
  });

  final String title;
  final String imagePath;
  final double price;
  final double? discount;
  final double stars;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
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
                '$stars',
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
            'assets/images/products/$imagePath',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
          SizedBox(height: BentoSpacing.xs),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BentoTextCaptionDF(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: BentoColor.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: BentoSpacing.xxs),
                BentoPrice(
                  price: price,
                  discount: discount!,
                ),
                SizedBox(height: BentoSpacing.xxxs),
                BentoButton(
                  title: 'See',
                  height: 30,
                  borderRadius: 10,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BentoProductCardSkeleton extends StatelessWidget {
  const BentoProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Color(0xFFF5F5F5),
              highlightColor: Colors.white,
              child: Container(
                height: 297,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Color(0xFFF5F5F5),
              highlightColor: Colors.white,
              child: Container(
                height: 297,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
