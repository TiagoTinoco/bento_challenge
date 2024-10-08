import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

import 'package:bento_challenge/ui/components/icon_button.dart';
import 'package:bento_challenge/ui/components/button.dart';
import 'package:bento_challenge/ui/components/price.dart';
import 'package:bento_challenge/ui/components/specifications.dart';
import 'package:bento_challenge/ui/components/carousel_product.dart';

import 'package:bento_challenge/controller/products_controller.dart';
import 'package:bento_challenge/models/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const routeName = '/product-detail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final _productsController = context.read<ProductsController>();
  late final ProductModel _product;
  bool _isLoading = true;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    getProductByID();
  }

  Future<ProductModel> getProductByID() async {
    ProductModel product = await _productsController.getProductByID();
    setState(() => _isLoading = false);
    _product = product;
    return product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            backgroundColor: const Color(0xFFFFFFFF),
            automaticallyImplyLeading: false,
            leading: Center(
              child: BentoIconButton(
                icon: Icons.arrow_back_ios_rounded,
                iconColor: BentoColor.secondary,
                backgroundColor: BentoColor.grey,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              BentoIconButton(
                icon: _isFavorite ? Icons.favorite_outlined : Icons.favorite_outline,
                iconColor: _isFavorite ? BentoColor.red : BentoColor.secondary,
                backgroundColor: _isFavorite ? BentoColor.red.withOpacity(0.1) : BentoColor.grey,
                onPressed: () => setState(() => _isFavorite = !_isFavorite),
              ),
              SizedBox(width: 8),
            ],
          ),
          SliverToBoxAdapter(
            child: _isLoading
                ? ProductDetailSkeleton()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BentoCarouselProduct(
                        imagesPath: _product.imagesPath,
                      ),
                      SizedBox(height: BentoSpacing.md),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: BentoSpacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: BentoTextTitle(
                                    _product.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: BentoColor.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 2,
                                    left: 6,
                                    right: 12,
                                    bottom: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: BentoColor.grey),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: BentoColor.yellow,
                                        size: 22,
                                      ),
                                      SizedBox(width: 2),
                                      BentoTextCaptionDF(
                                        '${_product.stars}',
                                        style: TextStyle(
                                          color: BentoColor.secondary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: BentoSpacing.xxs),
                            BentoTextCaptionDF(
                              'Shop: ${_product.storeName}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: BentoColor.secondary.withOpacity(0.75),
                              ),
                            ),
                            SizedBox(height: BentoSpacing.xs),
                            Container(
                              width: double.maxFinite,
                              height: 90,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: BentoColor.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: _product.specifications.map((specification) {
                                  return BentoSpecifications(
                                    title: specification.name,
                                    imagePath: specification.imagePath,
                                    backgroundColor: specification.color,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: BentoSpacing.sm),
                            BentoTextSubtitle(
                              'Details',
                              style: TextStyle(
                                color: BentoColor.secondary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: BentoSpacing.xxxs),
                            BentoTextBodyDF(
                              _product.description,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                                color: BentoColor.secondary.withOpacity(0.80),
                              ),
                            ),
                            SizedBox(height: BentoSpacing.xxs),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _isLoading
          ? BottomNavigationSkeleton()
          : Container(
              width: double.maxFinite,
              height: 90,
              padding: EdgeInsets.only(
                left: BentoSpacing.sm,
                right: BentoSpacing.sm,
                bottom: BentoSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border(
                  top: BorderSide(
                    color: BentoColor.grey,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BentoPrice(
                    price: _productsController.price,
                    discount: _productsController.discount,
                    fontsizeTitle: 14,
                    fontsizePrice: 28,
                    fontsizeDiscount: 15,
                  ),
                  SizedBox(width: BentoSpacing.md),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: BentoButton(
                        title: 'Add to Cart',
                        height: 50,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class ProductDetailSkeleton extends StatelessWidget {
  const ProductDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Color(0xFFF5F5F5),
          highlightColor: Colors.white,
          child: Container(
            width: double.maxFinite,
            height: 290,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        SizedBox(height: BentoSpacing.md),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: BentoSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Color(0xFFF5F5F5),
                      highlightColor: Colors.white,
                      child: Container(
                        width: double.maxFinite,
                        height: 33,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: BentoSpacing.xs),
                  Shimmer.fromColors(
                    baseColor: Color(0xFFF5F5F5),
                    highlightColor: Colors.white,
                    child: Container(
                      width: 65,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        border: Border.all(color: BentoColor.grey),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: BentoSpacing.xxxs),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: 150,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.xs),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: double.maxFinite,
                  height: 90,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: BentoColor.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.sm),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.xxxs),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: double.maxFinite,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.xxxs),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: double.maxFinite,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.xxxs),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: double.maxFinite,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.xxxs),
              Shimmer.fromColors(
                baseColor: Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: double.maxFinite,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: BentoSpacing.xxs),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomNavigationSkeleton extends StatelessWidget {
  const BottomNavigationSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFFF5F5F5),
      highlightColor: Colors.white,
      child: Container(
        width: double.maxFinite,
        height: 90,
        padding: EdgeInsets.only(
          left: BentoSpacing.sm,
          right: BentoSpacing.sm,
          bottom: BentoSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(
            top: BorderSide(
              color: BentoColor.grey,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
