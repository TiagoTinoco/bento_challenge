import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';

import 'package:bento_challenge/ui/navigation_page.dart';
import 'package:bento_challenge/ui/home_page.dart';
import 'package:bento_challenge/ui/product_detail_page.dart';

import 'package:bento_challenge/controller/categories_controller.dart';
import 'package:bento_challenge/controller/products_controller.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(milliseconds: 2600));
  FlutterNativeSplash.remove();
  runApp(const BentoChallenge());
}

class BentoChallenge extends StatelessWidget {
  const BentoChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoriesController()),
        ChangeNotifierProvider(create: (context) => ProductsController()),
      ],
      child: MaterialApp(
        title: 'Bento Challenge',
        initialRoute: NavigationPage.routeName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'NunitoSans',
          primaryColor: BentoColor.primary,
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        ),
        routes: {
          NavigationPage.routeName: (_) => const NavigationPage(),
          HomePage.routeName: (_) => const HomePage(),
          ProductDetailPage.routeName: (_) => const ProductDetailPage(),
        },
      ),
    );
  }
}
