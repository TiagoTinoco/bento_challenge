import 'package:flutter/material.dart';

import 'package:bento_challenge/ui/bento_custom/color.dart';
import 'package:bento_challenge/ui/bento_custom/text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BentoTextBodyDF(
        "I didn't have time to make this page 😕",
        style: TextStyle(
          color: BentoColor.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
