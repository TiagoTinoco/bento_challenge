import 'package:flutter/material.dart';
import 'package:bento_challenge/bento_colors.dart';

import 'package:bento_challenge/ui/splash_page.dart';
import 'package:bento_challenge/ui/home_page.dart';
import 'package:bento_challenge/ui/item_detail_page.dart';

void main() {
  runApp(const BentoChallenge());
}

class BentoChallenge extends StatelessWidget {
  const BentoChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bento Challenge',
      initialRoute: HomePage.routeName,
      theme: ThemeData(
        fontFamily: '',
        primaryColor: BentoColors.primary,
        useMaterial3: true,
      ),
      routes: {
        SplashPage.routeName: (_) => const SplashPage(),
        HomePage.routeName: (_) => const HomePage(),
        ItemDetailPage.routeName: (_) => const ItemDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
