import 'dart:ui';

import 'package:cbre/asset/components/payment_list_tile.dart';
import 'package:cbre/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../config/size_config.dart';
import '../style/colors.dart';
import '../style/style.dart';

class PaymentsDetailList extends StatelessWidget {
  var asset;
  PaymentsDetailList(this.asset);

  @override
  Widget build(BuildContext context) {
    var recentActivities = [
      {"amount": "\$6500", "label": "Cable Replacement"},
      {"amount": "\$350", "label": "Inspection"},
      {"amount": "\$4200", "label": "Pully"},
    ];
    var upcomingPayments;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 15),
                blurRadius: 15,
                color: AppColors.iconGray,
              ),
            ],
          ),
          child: Lottie.network(
              "https://lottie.host/12746b49-4222-478c-9d07-a1af5906851c/jY5gbaC1f2.json"),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              text: "#" +
                  asset["Asset ID"].toString() +
                  " " +
                  asset["Asset Type"],
              size: 38,
              fontWeight: FontWeight.w800,
              color: thirdColor,
            ),
            PrimaryText(
              text: '27 Apr, 2022',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            recentActivities.length,
            (index) => PaymentListTile(
              icon:
                  "https://lottie.host/48d019ea-f604-45c6-a4f9-afb107e5d3fc/Dmul2oYI9L.json",
              amount: recentActivities[index]["amount"],
              label: recentActivities[index]["label"],
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Upcoming Payments',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '12 May, 2022',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        // Column(
        //   children: List.generate(
        //     upcomingPayments.length,
        //     (index) => PaymentListTile(
        //       icon: upcomingPayments[index]["icon"],
        //       amount: upcomingPayments[index]["amount"],
        //       label: upcomingPayments[index]["label"],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
