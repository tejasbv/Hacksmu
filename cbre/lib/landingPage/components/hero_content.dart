import 'package:flutter/material.dart';

import 'desktop_hero.dart';
import 'mobile_hero.dart';
import 'tablet_hero.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 850) {
          return const DesktopHero();
        } else if (constraints.maxWidth >= 600) {
          return const TabletHero();
        }
        return const MobileHero();
      }),
    );
  }
}
