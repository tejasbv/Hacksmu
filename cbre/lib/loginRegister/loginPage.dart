// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/Pages/components/navigation.dart';
import 'package:flutter/material.dart';

import '../landingPage/home_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212332),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 16),
        children: [
          Menu(),
          // MediaQuery.of(context).size.width >= 980
          //     ? Menu()
          //     : SizedBox(), // Responsive
          Body()
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(
                  title: 'Home',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingScreen()),
                    );
                  }),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Sign In', isActive: true),
              _registerButton(context: context)
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
      {String title = 'Title Menu', isActive = false, press = null}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: (() {
            press();
          }),
          child: Column(
            children: [
              Text(
                '$title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? Color.fromARGB(230, 255, 255, 255)
                      : Colors.grey,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              isActive
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 151, 59, 156),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton({required context}) {
    return InkWell(
      onTap: (() {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => RegisterPage()),
        // );
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: (Color.fromARGB(255, 151, 59, 156)),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email, password, errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Ready to Let Our AI handle your Asset Maintenance?",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 1800.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20.0),
                  AutoSizeText(
                    "In the realm of building asset management, our cutting-edge AI-driven platform stands as a transformative solution. It simplifies and optimizes maintenance scheduling, ensuring that your building's assets are efficiently and effectively taken care of.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  AutoSizeText(
                    "Trusted by 1300+ Leadin brands",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18.0,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'Assets/login/AMericanExpress.png',
                            width: 300,
                          ),
                          Image.asset(
                            'Assets/login/Cerdian.png',
                            width: 300,
                          ),
                          Image.asset(
                            'Assets/login/Dropbox.png',
                            width: 300,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'Assets/login/IBM.png',
                            width: 300,
                          ),
                          Image.asset(
                            'Assets/login/DocuSign.png',
                            width: 300,
                          ),
                          Image.asset(
                            'Assets/login/hubspot.png',
                            width: 300,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          // MediaQuery.of(context).size.width >= 1300 //Responsive
          //     ? Image.asset(
          //         'images/illustration-1.png',
          //         width: 300,
          //       )
          //     : SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 6),
            child: Container(
              width: 500,
              child: _formLogin(context: context),
            ),
          )
        ],
      ),
    );
  }

  Widget _formLogin({required context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMessage == "" ? "" : errorMessage,
          style: TextStyle(color: Colors.red),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Container(
            width: 500,
            // height: 250,
            child: AutoSizeText(
              "Log in",
              maxLines: 2,
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextField(
          onChanged: ((value) {
            email = value;
          }),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter email',
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Color(0xFF2a2d3e),
            labelStyle: TextStyle(fontSize: 12, color: Colors.white),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          onChanged: (value) {
            password = value;
          },
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white),
            counterText: 'Forgot password?',
            counterStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Color(0xFF2a2d3e),
            labelStyle: TextStyle(fontSize: 12, color: Colors.white),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            // ignore: sort_child_properties_last
            child: Container(
                color: Color.fromARGB(255, 151, 59, 156),
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Sign In"))),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 151, 59, 156),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: (Colors.grey[300])!,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: (Colors.grey[400])!),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: (Colors.grey[400])!,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : BoxDecoration(),
        child: Image.asset(
          '$image',
          width: 35,
        ),
      )),
    );
  }
}
