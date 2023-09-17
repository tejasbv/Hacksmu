// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants/carouselConstants.dart';

class HeroImage extends StatefulWidget {
  const HeroImage({
    Key? key,
    this.imageHeight = 380.0,
    this.circleRadius = 260.0,
    this.bottom = 50.0,
    this.imageWidth,
  }) : super(key: key);
  final double imageHeight;
  final double circleRadius;
  final double bottom;
  final double? imageWidth;

  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {
  int _currentIndex = 0;
  List cardList = [
    Container(
      width: 300,
      height: 500,
      child: Column(children: [
        Container(
          width: 400,
          height: 375,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              image: DecorationImage(
                  image: AssetImage(
                    'images/illustration-1.jpg',
                  ),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
          child: Text(
            quote1,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Santana"),
            textAlign: TextAlign.center,
          ),
        )
      ]),
    ),
    Container(
      width: 300,
      height: 500,
      child: Column(children: [
        Container(
          width: 400,
          height: 375,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              image: DecorationImage(
                  image: AssetImage(
                    "images/carousel_image1.jpg",
                  ),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
          child: Text(
            quote2,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Santana"),
            textAlign: TextAlign.center,
          ),
        )
      ]),
    ),
    Container(
      width: 300,
      height: 500,
      child: Column(children: [
        Container(
          width: 400,
          height: 375,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              image: DecorationImage(
                  image: AssetImage(
                    "images/carousel_image2.jpg",
                  ),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
          child: Text(
            quote3,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Santana"),
            textAlign: TextAlign.center,
          ),
        )
      ]),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: widget.circleRadius,
          backgroundColor: Colors.purpleAccent[100],
        ),
        Container(
          width: 500,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Color.fromARGB(255, 97, 18, 110),
                    child: card,
                  ),
                );
              });
            }).toList(),
          ),
        ),
        // Positioned(
        //   bottom: bottom,
        //   // child: Image.asset(
        //   //   'images//ramsai.png',
        //   //   height: imageHeight,
        //   //   width: imageWidth ?? mediaQuery.width * 0.25,
        //   // ),
        // ),
      ],
    );
  }
}
