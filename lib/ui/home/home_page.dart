import 'package:bento_challenge/models/carousel_item.dart';
import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';
import 'package:bento_challenge/ui/components/category.dart';
import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/spacing.dart';

import 'package:bento_challenge/ui/components/button_image.dart';
import 'package:bento_challenge/ui/components/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: BentoSpacing.xs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonImage(
                title: 'ORDER AGAIN',
                imagePath: 'food-bag.png',
                onPressed: () {},
              ),
              SizedBox(width: BentoSpacing.xxxs),
              ButtonImage(
                title: 'LOCAL SHOP',
                imagePath: 'store.png',
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: BentoSpacing.xs),
        BentoCarousel(
          pages: [
            CarouselItem(
              title: 'FRESH AVOCADO UP TO 15% OFF',
              subtitle: 'Top deal !',
              buttonTitle: 'Shop Now',
              imagePath: 'avocado.png',
              backgroundColor: BentoColor.beige,
              invertBackgroundColorButton: true,
              onPressed: () {},
            ),
            CarouselItem(
              title: 'SO COME AND TRY THE BLUEBERRY',
              subtitle: 'Have you tried ?',
              buttonTitle: 'See Now',
              imagePath: 'blueberry.png',
              backgroundColor: Color(0xFFCAD7FC),
              onPressed: () {},
            ),
            CarouselItem(
              title: 'APPLE SEASON, BUY TODAY',
              subtitle: 'Most purchased !',
              buttonTitle: 'Buy Now',
              imagePath: 'apple.png',
              backgroundColor: Color(0xFFFCCACA),
              invertBackgroundColorButton: true,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: BentoSpacing.xs),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: BentoSpacing.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BentoTextSubtitle(
                'Shop by category',
                style: TextStyle(
                  color: BentoColor.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: BentoSpacing.xxs),
              Row(
                children: [
                  BentoCategory(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
