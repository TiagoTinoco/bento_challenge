import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';

class WaveLoading extends StatefulWidget {
  const WaveLoading({super.key});

  @override
  State<WaveLoading> createState() => _WaveLoadingState();
}

class _WaveLoadingState extends State<WaveLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFirstDot;
  late Animation<double> _animationSecondDot;
  late Animation<double> _animationThirdDot;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animationFirstDot = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _animationSecondDot = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.7, curve: Curves.easeInOut),
      ),
    );

    _animationThirdDot = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 0.9, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 18, bottom: 10),
        width: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WaveDot(animation: _animationFirstDot),
            WaveDot(animation: _animationSecondDot),
            WaveDot(animation: _animationThirdDot),
          ],
        ),
      ),
    );
  }
}

class WaveDot extends AnimatedWidget {
  const WaveDot({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Transform.translate(
      offset: Offset(0, -animation.value),
      child: const Dot(),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: BentoColor.secondary.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
    );
  }
}
