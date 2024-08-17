import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class BentoCategoryButton extends StatefulWidget {
  const BentoCategoryButton({
    super.key,
    required this.name,
    required this.imagePath,
  });

  final String name;
  final String imagePath;

  @override
  State<BentoCategoryButton> createState() => _BentoCategoryButtonState();
}

class _BentoCategoryButtonState extends State<BentoCategoryButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {
              setState(() => _isTapped = !_isTapped),
            },
            child: Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: !_isTapped ? BentoColor.grey : BentoColor.primary.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/categories/${widget.imagePath}',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: BentoSpacing.xxs / 2),
          BentoTextCaptionDF(
            widget.name,
            style: TextStyle(
              fontSize: 12,
              color: BentoColor.secondary,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class BentoCategoryButtonSkeleton extends StatelessWidget {
  const BentoCategoryButtonSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Color(0xFFF5F5F5),
            highlightColor: Colors.white,
            child: Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 5),
          Shimmer.fromColors(
            baseColor: Color(0xFFF5F5F5),
            highlightColor: Colors.white,
            child: Container(
              width: 50,
              height: 17,
              color: Color(0xFFF5F5F5),
            ),
          ),
        ],
      ),
    );
  }
}
