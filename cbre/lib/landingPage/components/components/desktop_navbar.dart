// ignore_for_file: prefer_const_constructors

import 'package:cbre/constants.dart';
import 'package:cbre/landingPage/components/components/search_button.dart';
import 'package:flutter/material.dart';

import 'navbar_items.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 100.0;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: width > 850 ? (width * 0.07) : (width * 0.05)),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          // const Header(),
          //navbar_items

          const SizedBox(
            height: 30,
            child: NavbarItems(),
          ),

          //trailing
          if (width >= 1100)
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SearchButton(),
                  const SizedBox(width: 10.0),
                  IconButton(
                    icon: const Icon(
                      Icons.lock_outline,
                      color: thirdColor,
                      size: 25.0,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "login",
                    style: TextStyle(
                      color: thirdColor,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
