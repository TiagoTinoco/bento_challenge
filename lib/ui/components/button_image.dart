import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class ButtonImage extends StatefulWidget {
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
  State<ButtonImage> createState() => _ButtonImageState();
}

class _ButtonImageState extends State<ButtonImage> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isTapped = true),
        onTapUp: (_) {
          setState(() => _isTapped = false);
          widget.onPressed();
        },
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          height: 80,
          decoration: BoxDecoration(
            color: _isTapped ? BentoColor.primary.shade700 : BentoColor.primary,
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
                      widget.title,
                      style: TextStyle(
                        color: BentoColor.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Positioned(
                bottom: 0.5,
                right: 0.5,
                child: Image.asset(
                  'assets/images/button/${widget.imagePath}',
                  width: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
