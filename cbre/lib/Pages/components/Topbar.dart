import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 600,
      child: Row(
        children: [
          Container(
            width: 500,
            height: 150,
            margin: EdgeInsets.only(bottom: 75),
            child: Image.asset(
              'Assets/logo.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
