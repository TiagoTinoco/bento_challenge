import 'dart:async';
import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

import 'package:bento_challenge/ui/components/models/carousel_banner_item.dart';
import 'package:bento_challenge/ui/components/button.dart';

class BentoCarouselBanner extends StatefulWidget {
  const BentoCarouselBanner({
    super.key,
    required this.pages,
  });

  final List<CarouselBannerItem> pages;

  @override
  State<BentoCarouselBanner> createState() => _BentoCarouselBannerState();
}

class _BentoCarouselBannerState extends State<BentoCarouselBanner> {
  final PageController _pageController = PageController();
  late Timer _timer;
  late List<CarouselBannerItem> pages = widget.pages;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 4500), (timer) {
      _currentPage = (_currentPage + 1) % pages.length;

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) => setState(() => _currentPage = index),
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: BentoSpacing.xs),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: pages[index].backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BentoTextCaptionDF(
                                pages[index].subtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: BentoColor.secondary.withOpacity(0.75),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: BentoSpacing.xxxs),
                              BentoTextSubtitle(
                                pages[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: BentoColor.secondary,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: BentoSpacing.xxs),
                              BentoButton(
                                title: pages[index].buttonTitle,
                                invertBackgroundColor: pages[index].invertBackgroundColorButton,
                                width: 120,
                                height: 40,
                                onPressed: pages[index].onPressed,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/banner/${pages[index].imagePath}',
                          fit: BoxFit.contain,
                          width: 130,
                          height: 130,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
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
