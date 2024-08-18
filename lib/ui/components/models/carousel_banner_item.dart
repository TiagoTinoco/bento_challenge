import 'package:flutter/material.dart';

/// this item was created for use with CarouselBanner()
class CarouselBannerItem {
  CarouselBannerItem({
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    required this.imagePath,
    required this.backgroundColor,
    required this.onPressed,
    this.invertBackgroundColorButton = false,
  });

  final String title;
  final String subtitle;
  final String buttonTitle;
  final String imagePath;
  final Color backgroundColor;
  final bool invertBackgroundColorButton;
  final VoidCallback onPressed;
}
