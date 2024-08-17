import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/splash_page.dart';
import 'package:bento_challenge/ui/navigation_page.dart';
import 'package:bento_challenge/ui/home/home_page.dart';
import 'package:bento_challenge/ui/item_detail/item_detail_page.dart';

void main() {
  runApp(const BentoChallenge());
}

class BentoChallenge extends StatelessWidget {
  const BentoChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bento Challenge',
      initialRoute: NavigationPage.routeName,
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        primaryColor: BentoColor.primary,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      routes: {
        SplashPage.routeName: (_) => const SplashPage(),
        NavigationPage.routeName: (_) => const NavigationPage(),
        HomePage.routeName: (_) => const HomePage(),
        ItemDetailPage.routeName: (_) => const ItemDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
