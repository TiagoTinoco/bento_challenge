import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: BentoColor.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: BentoSpacing.xs),
              child: SizedBox(
                width: 70,
                child: Center(
                  child: BentoTextBodyDF(
                    title,
                    style: TextStyle(
                      color: BentoColor.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Espaço para ajustar a posição do texto dentro do Stack
            Spacer(),
            Positioned(
              bottom: 1,
              right: 0,
              child: Image.asset(
                'assets/images/$imagePath',
                width: 60,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
