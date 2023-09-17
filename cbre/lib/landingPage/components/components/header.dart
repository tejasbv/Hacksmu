// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../home_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingScreen()),
            );
          },
          child: Row(
            children: [
              Text(
                "Combl",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Santana"),
              ),
              Text(
                ".",
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
