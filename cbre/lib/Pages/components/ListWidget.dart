// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cbre/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
// import 'package:lottie/lottie.dart';

// class ListWidget extends StatefulWidget {
//   var asset;
//   ListWidget(this.asset) {
//     print(asset["Asset ID"]);
//   }

//   @override
//   State<ListWidget> createState() => _ListWidgetState(asset);
// }

// class _ListWidgetState extends State<ListWidget> {
//   var isHover = false;
//   var isSelected = false;
//   var asset;
//   _ListWidgetState(this.asset);
//   Widget image() {
//     return Container(
//       width: 100,
//       height: 100,
//       child: Lottie.network(
//         asset["Asset Type"] == "Elevator"
//             ? "https://lottie.host/12746b49-4222-478c-9d07-a1af5906851c/jY5gbaC1f2.json"
//             : asset["Asset Type"] == "Plumbing System"
//                 ? "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json"
//                 : asset["Asset Type"] == "Fire Alarm"
//                     ? "https://lottie.host/22cc0902-a95b-4995-a015-bb9f00692dc3/tOjwtheTXs.json"
//                     : asset["Asset Type"] == "HVAC"
//                         ? "https://lottie.host/694f68ac-9c61-41d0-a841-9b193293d760/plYxGMZkN2.json"
//                         : asset["Asset Type"] == "Electrical Panel"
//                             ? "https://lottie.host/c877ced6-7d36-49bf-8213-a1cb86cce80e/z8HS92WUQ4.json"
//                             : "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json",
//         fit: BoxFit.fill,
//         animate: isHover,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Column(children: [
//         Row(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               child: Transform.scale(
//                 scale: 2,
//                 child: Checkbox(
//                   value: isSelected,
//                   onChanged: (value) {
//                     setState(() {
//                       isSelected = value!;
//                     });
//                   },
//                   focusColor: Colors.white,
//                   activeColor: mainColor,
//                   checkColor: secondaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(2.0),
//                   ),
//                   side: MaterialStateBorderSide.resolveWith(
//                     (states) => BorderSide(width: 1.0, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//                 width: 100,
//                 height: 100,
//                 child: Lottie.network(
//                   asset["Asset Type"] == "Elevator"
//                       ? "https://lottie.host/12746b49-4222-478c-9d07-a1af5906851c/jY5gbaC1f2.json"
//                       : asset["Asset Type"] == "Plumbing System"
//                           ? "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json"
//                           : asset["Asset Type"] == "Fire Alarm"
//                               ? "https://lottie.host/22cc0902-a95b-4995-a015-bb9f00692dc3/tOjwtheTXs.json"
//                               : asset["Asset Type"] == "HVAC"
//                                   ? "https://lottie.host/694f68ac-9c61-41d0-a841-9b193293d760/plYxGMZkN2.json"
//                                   : asset["Asset Type"] == "Electrical Panel"
//                                       ? "https://lottie.host/c877ced6-7d36-49bf-8213-a1cb86cce80e/z8HS92WUQ4.json"
//                                       : "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json",
//                   fit: BoxFit.fill,
//                   animate: isHover,
//                 )),
//             Container(
//               width: 100,
//               padding: EdgeInsets.only(right: 10),
//               child: AutoSizeText(
//                 asset["Asset ID"].toString(),
//                 maxLines: 1,
//                 style: const TextStyle(
//                   color: Colors.white60,
//                   fontSize: 36.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               width: 400,
//               padding: EdgeInsets.only(right: 20),
//               child: AutoSizeText(
//                 asset["Asset Type"].toString(),
//                 maxLines: 2,
//                 style: const TextStyle(
//                   color: Colors.white60,
//                   fontSize: 36.0,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Container(
//               width: 150,
//               padding: EdgeInsets.only(right: 15),
//               child: AutoSizeText(
//                 asset["Days Since Last Service"].toString(),
//                 maxLines: 1,
//                 style: const TextStyle(
//                   color: Colors.white60,
//                   fontSize: 36.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               width: 150,
//               padding: EdgeInsets.only(right: 15),
//               child: AutoSizeText(
//                 asset["Asset Criticality"].toString(),
//                 maxLines: 1,
//                 style: const TextStyle(
//                   color: Colors.white60,
//                   fontSize: 36.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               width: 150,
//               padding: EdgeInsets.only(right: 15),
//               child: AutoSizeText(
//                 asset["Predicted Cost of Repair"].toString(),
//                 maxLines: 1,
//                 style: const TextStyle(
//                   color: Colors.white60,
//                   fontSize: 36.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               width: 150,
//               padding: EdgeInsets.only(right: 15),
//               child: AutoSizeText(
//                 asset["Naïve Prediction of Days"].toString(),
//                 maxLines: 1,
//                 style: const TextStyle(
//                   color: Colors.white60,
//                   fontSize: 36.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//         Divider(
//           thickness: 5,
//         )
//       ]),
//       onHover: (value) {
//         setState(() {
//           print(value);
//           isHover = value;
//         });
//       },
//     );
//   }
// }
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
//

//
class ListWidget extends StatelessWidget {
  var isHover = false;
  var isSelected = false;
  var asset;
  ListWidget(this.asset, {super.key});
  Widget image() {
    return Container(
      width: 100,
      height: 100,
      child: Lottie.network(
        asset["Asset Type"] == "Elevator"
            ? "https://lottie.host/12746b49-4222-478c-9d07-a1af5906851c/jY5gbaC1f2.json"
            : asset["Asset Type"] == "Plumbing System"
                ? "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json"
                : asset["Asset Type"] == "Fire Alarm"
                    ? "https://lottie.host/22cc0902-a95b-4995-a015-bb9f00692dc3/tOjwtheTXs.json"
                    : asset["Asset Type"] == "HVAC"
                        ? "https://lottie.host/694f68ac-9c61-41d0-a841-9b193293d760/plYxGMZkN2.json"
                        : asset["Asset Type"] == "Electrical Panel"
                            ? "https://lottie.host/c877ced6-7d36-49bf-8213-a1cb86cce80e/z8HS92WUQ4.json"
                            : "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json",
        fit: BoxFit.fill,
        animate: isHover,
      ),
    );
  }

//
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Transform.scale(
              scale: 2,
              child: Checkbox(
                value: isSelected,
                onChanged: (value) {},
                focusColor: Colors.white,
                activeColor: mainColor,
                checkColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 1.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
              width: 100,
              height: 100,
              child: Lottie.network(
                asset["Asset Type"] == "Elevator"
                    ? "https://lottie.host/12746b49-4222-478c-9d07-a1af5906851c/jY5gbaC1f2.json"
                    : asset["Asset Type"] == "Plumbing System"
                        ? "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json"
                        : asset["Asset Type"] == "Fire Alarm"
                            ? "https://lottie.host/22cc0902-a95b-4995-a015-bb9f00692dc3/tOjwtheTXs.json"
                            : asset["Asset Type"] == "HVAC"
                                ? "https://lottie.host/694f68ac-9c61-41d0-a841-9b193293d760/plYxGMZkN2.json"
                                : asset["Asset Type"] == "Electrical Panel"
                                    ? "https://lottie.host/c877ced6-7d36-49bf-8213-a1cb86cce80e/z8HS92WUQ4.json"
                                    : "https://lottie.host/8fa39020-48c2-4e04-b5c0-eaad52ad9ea5/60s3Y5oQ3D.json",
                fit: BoxFit.fill,
                animate: isHover,
              )),
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
              asset["Days Since Last Service"].toString(),
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
              asset["Predicted Cost of Repair"].toString(),
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
              asset["Naïve Prediction of Days"].toString(),
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
