import 'package:bento_challenge/ui/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bento_challenge/ui/bento_custom/text.dart';
import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';

import 'package:bento_challenge/models/category_model.dart';
import 'package:bento_challenge/models/product_model.dart';

import 'package:bento_challenge/ui/components/models/carousel_banner_item.dart';
import 'package:bento_challenge/ui/components/button_image.dart';
import 'package:bento_challenge/ui/components/category_button.dart';
import 'package:bento_challenge/ui/components/carousel_banner.dart';
import 'package:bento_challenge/ui/components/product_card.dart';

import 'package:bento_challenge/controller/categories_controller.dart';
import 'package:bento_challenge/controller/products_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _categoriesController = context.read<CategoriesController>();
  late final _productsController = context.read<ProductsController>();

  List<CarouselBannerItem> bannerItems = [
    CarouselBannerItem(
      title: 'FRESH AVOCADO UP TO 15% OFF',
      subtitle: 'Top deal !',
      buttonTitle: 'Shop Now',
      imagePath: 'avocado.png',
      backgroundColor: Color(0xFFF0F5DC),
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
                future: _categoriesController.getCategories(),
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
              SizedBox(height: BentoSpacing.xxxs),
              FutureBuilder<List<ProductModel>>(
                future: _productsController.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError) {
                    return BentoProductCardSkeleton();
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Container(
                      width: double.maxFinite,
                      height: 80,
                      color: BentoColor.primary.shade100,
                      child: Center(
                        child: BentoTextBodyDF(
                          'No products found.',
                          style: TextStyle(
                            color: BentoColor.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  } else {
                    final List<ProductModel> products = snapshot.data!;

                    return SizedBox(
                      height: products.length / 2 * 315,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: 297,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return BentoProductCard(
                            title: products[index].title,
                            price: products[index].price,
                            discount: products[index].discount,
                            stars: products[index].stars,
                            imagePath: products[index].imagesPath[0],
                            backgroundColor: products[index].backgroundColor,
                            onPressed: () async {
                              await _productsController.setId(products[index].id);
                              Navigator.of(context).pushNamed(ProductDetailPage.routeName);
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
