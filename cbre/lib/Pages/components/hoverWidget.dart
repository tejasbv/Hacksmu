import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../constants.dart';

class HoveringWidget extends StatefulWidget {
  var val;

  HoveringWidget(this.val);
  _HoveringWidgetState createState() => _HoveringWidgetState(val);
}

class _HoveringWidgetState extends State<HoveringWidget> {
  bool isHover = false;
  var dt;
  _HoveringWidgetState(this.dt);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: 200,
          height: 200,
          child: Card(
              color: Color.fromARGB(255, 117, 46, 121),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        height: 100,
                        width: 100,
                        child: Lottie.network(
                            dt["Asset Type"] == "Elevator"
                                ? "https://lottie.host/12746b49-4222-478c-9d07-a1af5906851c/jY5gbaC1f2.json"
                                : dt["Asset Type"] == "Plumbing System"
                                    ? "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json"
                                    : dt["Asset Type"] == "Fire Alarm"
                                        ? "https://lottie.host/22cc0902-a95b-4995-a015-bb9f00692dc3/tOjwtheTXs.json"
                                        : dt["Asset Type"] == "HVAC"
                                            ? "https://lottie.host/694f68ac-9c61-41d0-a841-9b193293d760/plYxGMZkN2.json"
                                            : dt["Asset Type"] ==
                                                    "Electrical Panel"
                                                ? "https://lottie.host/c877ced6-7d36-49bf-8213-a1cb86cce80e/z8HS92WUQ4.json"
                                                : "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json",
                            fit: BoxFit.fill,
                            animate: isHover,
                            repeat: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: AutoSizeText(
                          "#" + dt["Asset ID"].toString(),
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 50.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: AutoSizeText(
                      dt["Last Serviced Date"].toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: AutoSizeText(
                      "\$" + dt["Asset Age (days)"].toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ),
        onTap: () {},
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        }
        /*val--->true when user brings in mouse
          val---> false when brings out his mouse*/
        );
  }
}
