import 'package:cbre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/responsive.dart';
import '../config/size_config.dart';
import '../style/colors.dart';
import '../style/style.dart';

class InfoCard extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;
  const InfoCard(
      {Key? key, required this.icon, required this.label, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      // constraints:
      //     BoxConstraints(minWidth: Responsive.isDesktop(context) ? 200.0 : 140),
      padding: EdgeInsets.fromLTRB(
          20.0, 20.0, Responsive.isDesktop(context) ? 40 : 10, 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon!,
            width: Responsive.isDesktop(context) ? 35 : 28,
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 2,
          ),
          PrimaryText(
            text: label!,
            size: Responsive.isDesktop(context) ? 30 : 14,
            color: mainColor,
            fontWeight: FontWeight.w900,
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 1,
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: PrimaryText(
              text: amount!,
              size: Responsive.isDesktop(context) ? 24 : 16,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
