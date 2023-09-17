import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
//

//
class WorkOrderWidget extends StatelessWidget {
  var isHover = false;
  var asset;
  WorkOrderWidget(this.asset, {super.key});

//
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.only(right: 10),
            child: AutoSizeText(
              asset["Asset ID"].toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 400,
            padding: EdgeInsets.only(right: 20),
            child: AutoSizeText(
              asset["Asset Type"].toString(),
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.only(right: 15),
            child: AutoSizeText(
              asset["Last Serviced Date"].toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.only(right: 15),
            child: AutoSizeText(
              asset["Asset Criticality"].toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.only(right: 15),
            child: AutoSizeText(
              asset["Price of Repair"].toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.only(right: 15),
            child: AutoSizeText(
              asset["Prediction of next repair"].toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      Divider(
        thickness: 5,
      )
    ]);
  }
}
//
