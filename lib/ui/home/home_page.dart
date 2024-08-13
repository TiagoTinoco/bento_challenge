import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/text.dart';
import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/components/avatar.dart';
import 'package:bento_challenge/ui/components/dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            toolbarHeight: 110,
            titleSpacing: 18,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BentoTextBodyDF(
                  'Delivery',
                  style: TextStyle(
                    color: BentoColor.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const BentoDropdown(),
              ],
            ),
            actions: [
              BentoAvatar(
                imagePath: 'profile.png',
                onPressed: () {
                  // TODO(tiago-tinoco): Should take the profile page
                  // onPressed: () => Navigator.of(context).pushNamed('/profile'),
                },
              ),
            ],
            automaticallyImplyLeading: false,
          ),
        ],
      ),
    );
  }
}
