import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/Pages/components/SummaryWidget.dart';
import 'package:cbre/Pages/components/hoverWidget.dart';
import 'package:cbre/data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../constants.dart';

class Tile extends StatefulWidget {
  var val;
  var dt = [];
  Tile(this.val) {
    data.forEach((element) {
      if (element["Asset Type"] == val && dt.length < 10) {
        dt.add(element);
      } else if (val == "Summary") {
        dt.add("Elevator");
        dt.add("Plubming");
        dt.add("Fire Alarm");
        dt.add("HVAC");
        dt.add("Electrical");
        dt.add("Totals");
      }
    });
  }
  _TileState createState() => _TileState(dt, val);
}

class _TileState extends State<Tile> {
  bool isHover = false;
  var val;
  var dt = [];
  List<Widget> list = [];

  _TileState(this.dt, this.val) {
    if (val != "Summary") {
      dt.forEach((element) {
        list.add(HoveringWidget(element));
      });
    } else {
      var myd = {
        "Elevator": [0, 0, 0, 0],
        "Plubming": [0, 0, 0, 0],
        "Fire": [0, 0, 0, 0],
        "HVAC": [0, 0, 0, 0],
        "Electrical": [0, 0, 0, 0],
        "Totals": [0, 0, 0, 0],
      };
      // data.forEach((element) {
      //   switch (element["Asset Type"]) {
      //     case "Elevator":
      //       int.parse(element["Naïve Prediction of Days"].toString()) < 10
      //           ? myd["Elevator"]![3] += 1
      //           : int.parse(element["Naïve Prediction of Days"].toString()) < 30
      //               ? myd["Elevator"]![2] += 1
      //               : int.parse(element["Naïve Prediction of Days"]
      //                           .toString()) <=
      //                       60
      //                   ? myd["Elevator"]![1] += 1
      //                   : myd["Elevator"]![0] += 1;

      //       break;
      //     case "Plumbing System":
      //       int.parse(element["Naïve Prediction of Days"].toString()) < 10
      //           ? myd["Plumbing"]![3] += 1
      //           : int.parse(element["Naïve Prediction of Days"].toString()) < 30
      //               ? myd["Plumbing"]![2] += 1
      //               : int.parse(element["Naïve Prediction of Days"]
      //                           .toString()) <=
      //                       60
      //                   ? myd["Plumbing"]![1] += 1
      //                   : myd["Plumbing"]![0] += 1;
      //       break;
      //     case "Fire Alarm":
      //       int.parse(element["Naïve Prediction of Days"].toString()) < 10
      //           ? myd["Fire"]![3] += 1
      //           : int.parse(element["Naïve Prediction of Days"].toString()) < 30
      //               ? myd["Fire"]![2] += 1
      //               : int.parse(element["Naïve Prediction of Days"]
      //                           .toString()) <=
      //                       60
      //                   ? myd["Fire"]![1] += 1
      //                   : myd["Fire"]![0] += 1;
      //       break;
      //     case "HVAC":
      //       int.parse(element["Naïve Prediction of Days"].toString()) < 10
      //           ? myd["HVAC"]![3] += 1
      //           : int.parse(element["Naïve Prediction of Days"].toString()) < 30
      //               ? myd["HVAC"]![2] += 1
      //               : int.parse(element["Naïve Prediction of Days"]
      //                           .toString()) <=
      //                       60
      //                   ? myd["HVAC"]![1] += 1
      //                   : myd["HVAC"]![0] += 1;
      //       break;
      //     case "Electrical Panel":
      //       int.parse(element["Naïve Prediction of Days"].toString()) < 10
      //           ? myd["Electrical"]![3] += 1
      //           : int.parse(element["Naïve Prediction of Days"].toString()) < 30
      //               ? myd["Electrical"]![2] += 1
      //               : int.parse(element["Naïve Prediction of Days"]
      //                           .toString()) <=
      //                       60
      //                   ? myd["Electrical"]![1] += 1
      //                   : myd["Electrical"]![0] += 1;
      //       break;
      //     default:
      //   }
      // });
      // dt.forEach((element) {
      //   list.add(buildWidget(element, myd));
      // });
      // dt.forEach((element) {
      //   list.add(SUmmaryWidget(element, myd));
      // });
      list.add(SUmmaryWidget("Elevator", myd));
      list.add(SUmmaryWidget("Plubming", myd));
      list.add(SUmmaryWidget("Fire", myd));
      list.add(SUmmaryWidget("HVAC", myd));
      list.add(SUmmaryWidget("Electrical", myd));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 250,
        height: MediaQuery.of(context).size.height - 250,
        padding: EdgeInsets.only(left: 50, right: 50),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 20),
            children: list));
  }
}
