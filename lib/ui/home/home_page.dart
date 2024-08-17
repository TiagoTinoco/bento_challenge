import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/text.dart';
import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';

import 'package:bento_challenge/models/category_model.dart';

import 'package:bento_challenge/ui/components/models/carousel_banner_item.dart';
import 'package:bento_challenge/ui/components/button_image.dart';
import 'package:bento_challenge/ui/components/category_button.dart';
import 'package:bento_challenge/ui/components/carousel_banner.dart';
import 'package:bento_challenge/ui/components/product_card.dart';

import 'package:bento_challenge/repository/categories_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoriesRepository categoriesRepository = LocalCategoriesRepository();

  List<CarouselBannerItem> bannerItems = [
    CarouselBannerItem(
      title: 'FRESH AVOCADO UP TO 15% OFF',
      subtitle: 'Top deal !',
      buttonTitle: 'Shop Now',
      imagePath: 'avocado.png',
      backgroundColor: BentoColor.beige,
      invertBackgroundColorButton: true,
      onPressed: () {},
    ),
    CarouselBannerItem(
      title: 'SO COME AND TRY THE BLUEBERRY',
      subtitle: 'Have you tried ?',
      buttonTitle: 'See Now',
      imagePath: 'blueberry.png',
      backgroundColor: Color(0xFFCAD7FC),
      onPressed: () {},
    ),
    CarouselBannerItem(
      title: 'APPLE SEASON, BUY TODAY',
      subtitle: 'Most purchased !',
      buttonTitle: 'Buy Now',
      imagePath: 'apple.png',
      backgroundColor: Color(0xFFFCCACA),
      invertBackgroundColorButton: true,
      onPressed: () {},
    ),
  ];

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
        SizedBox(height: BentoSpacing.xxs),
        BentoCarouselBanner(pages: bannerItems),
        SizedBox(height: BentoSpacing.xs),
        Padding(
          padding: EdgeInsets.only(left: BentoSpacing.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BentoTextSubtitle(
                'Shop by category',
                style: TextStyle(
                  color: BentoColor.secondary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: BentoSpacing.xxs),
              FutureBuilder<List<CategoryModel>>(
                future: categoriesRepository.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5, (index) => BentoCategoryButtonSkeleton()),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Container(
                      width: double.maxFinite,
                      height: 80,
                      color: BentoColor.primary.shade100,
                      child: Center(
                        child: BentoTextBodyDF(
                          'No categories found.',
                          style: TextStyle(
                            color: BentoColor.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  } else {
                    List<CategoryModel> categories = snapshot.data!;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          return BentoCategoryButton(
                            name: category.name,
                            imagePath: category.imagePath,
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: BentoSpacing.xs,
            right: BentoSpacing.xs,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BentoTextSubtitle(
                    "Today's Special",
                    style: TextStyle(
                      color: BentoColor.secondary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: BentoTextCaptionDF(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        color: BentoColor.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: BentoSpacing.xxs),
              BentoProductCard(),
            ],
          ),
        ),
      ],
    );
  }
}
