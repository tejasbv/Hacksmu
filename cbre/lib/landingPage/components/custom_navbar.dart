import 'package:flutter/material.dart';
import 'components/desktop_navbar.dart';
import 'components/mobile_appbar.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbar();
        }
        //else if (constraints.maxWidth >= kTabletWidth) {
        //   return const Des();
        // }
        return const MobileNavbar();
      }),
    );
  }
}
