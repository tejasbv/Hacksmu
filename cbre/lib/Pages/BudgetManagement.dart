import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/Topbar.dart';

class BudgetManagement extends StatefulWidget {
  const BudgetManagement({super.key});

  @override
  State<BudgetManagement> createState() => _BudgetManagementState();
}

class _BudgetManagementState extends State<BudgetManagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 500, child: Center(child: TopBar())),
          AutoSizeText(
            "Budget",
            maxLines: 2,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 50.0,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 500),
            height: (MediaQuery.of(context).size.height - 300),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                    width: (MediaQuery.of(context).size.width - 500) / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage("Assets/g4.png"),
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width - 500) / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        padding: EdgeInsets.all(20),
                        child: Image(
                            image: AssetImage("Assets/g5.png"),
                            fit: BoxFit.fill)),
                    Container(
                        width: (MediaQuery.of(context).size.width - 500) / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        padding: EdgeInsets.all(20),
                        child: Image(
                            image: AssetImage("Assets/g3.png"),
                            fit: BoxFit.fill)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width - 500) / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        padding: EdgeInsets.all(20),
                        child: Image(
                            image: AssetImage("Assets/g1.png"),
                            fit: BoxFit.fill)),
                    Container(
                        width: (MediaQuery.of(context).size.width - 500) / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        padding: EdgeInsets.all(20),
                        child: Image(
                            image: AssetImage("Assets/g2.png"),
                            fit: BoxFit.fill)),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
