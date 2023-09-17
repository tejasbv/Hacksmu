// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CappucinoTitle(),
        SizedBox(height: 40.0),
        AboutCappucino(),
        SizedBox(height: 20.0),
        SizedBox(height: 10.0),
        BuyNowButton(),
      ],
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => RegisterPage()));
      }),
      child: Container(
        alignment: Alignment.center,
        width: 150.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.navigate_next_rounded,
                color: Colors.deepOrangeAccent, size: 30.0),
          ],
        ),
      ),
    );
  }
}

class AboutCappucino extends StatelessWidget {
  const AboutCappucino({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Let our AI maintain all your asset servicing",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}

class CappucinoTitle extends StatelessWidget {
  const CappucinoTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Ready to Handle Your Assets?",
      maxLines: 2,
      style: TextStyle(
        color: Colors.purpleAccent,
        fontSize: 900.0,
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.left,
    );
  }
}
