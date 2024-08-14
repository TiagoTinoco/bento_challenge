import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/spacing.dart';

import 'package:bento_challenge/ui/components/button_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonImage(
              title: 'ORDER AGAIN',
              imagePath: 'food-bag.png',
              onPressed: () {},
            ),
            SizedBox(width: BentoSpacing.xxs),
            ButtonImage(
              title: 'LOCAL SHOP',
              imagePath: 'store.png',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
