import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/spacing.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

import 'package:bento_challenge/ui/components/avatar.dart';
import 'package:bento_challenge/ui/components/dropdown.dart';
import 'package:bento_challenge/ui/home/home_page.dart';
import 'package:bento_challenge/ui/others/account_page.dart';
import 'package:bento_challenge/ui/others/cart_page.dart';
import 'package:bento_challenge/ui/others/deals_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  static const routeName = '/navigation';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  List<Widget> pages = <Widget>[
    HomePage(),
    DealsPage(),
    HomePage(),
    CartPage(),
    AccountPage(),
  ];

  List<TabItem> iconsPage = <TabItem>[
    TabItem(icon: Icons.home_rounded, title: 'Home'),
    TabItem(icon: Icons.local_offer_rounded, title: 'Deals'),
    TabItem(icon: Icons.store_rounded),
    TabItem(icon: Icons.shopping_bag_rounded, title: 'Cart'),
    TabItem(icon: Icons.person, title: 'Account'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: BentoSpacing.xs,
            toolbarHeight: 100,
            backgroundColor: const Color(0xFFFFFFFF),
            automaticallyImplyLeading: false,
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
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: pages[_tabController!.index],
          ),
        ],
      ),
      bottomNavigationBar: BottomBarInspiredInside(
        items: iconsPage,
        indexSelected: _tabController!.index,
        height: 45,
        iconSize: 26,
        fixed: true,
        fixedIndex: 2,
        padTop: 10,
        padbottom: 20,
        elevation: 5,
        backgroundColor: Color(0xFFFFFFFF),
        color: BentoColor.darkGreen,
        colorSelected: BentoColor.primary,
        itemStyle: ItemStyle.circle,
        titleStyle: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        chipStyle: ChipStyle(
          convexBridge: true,
          color: BentoColor.secondary,
          background: BentoColor.secondary,
        ),
        onTap: (int index) => setState(() => _tabController!.index = index),
      ),
    );
  }
}
