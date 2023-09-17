// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'components/components/desktop_navbar.dart';
import 'components/custom_navbar.dart';
import 'components/hero_content.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      //drawer: const AppDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF212332),
        child: SafeArea(
          child: Column(
            children: [
              DesktopNavbar(),
              HeroContent(),
            ],
          ),
        ),
      ),
    );
  }
}
