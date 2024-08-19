import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';

class BentoCarouselProduct extends StatefulWidget {
  const BentoCarouselProduct({
    super.key,
    required this.imagesPath,
    this.backgroundColor = const Color(0xFFF5F5F5),
  });

  final List<String> imagesPath;
  final Color? backgroundColor;

  @override
  State<BentoCarouselProduct> createState() => _BentoCarouselProductState();
}

class _BentoCarouselProductState extends State<BentoCarouselProduct> {
  final PageController _pageController = PageController();

  late Color backgroundColor = widget.backgroundColor!;
  late List<String> imagesPath = widget.imagesPath;

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) => setState(() => _currentPage = index),
              itemCount: imagesPath.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/images/products/${imagesPath[index]}',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: BentoSpacing.lg, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagesPath.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  height: 6,
                  width: _currentPage == index ? 28 : 6,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? BentoColor.primary : BentoColor.darkGreen,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
