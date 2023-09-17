import 'package:cbre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../style/colors.dart';
import '../style/style.dart';

class PaymentListTile extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;
  const PaymentListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,
      leading: Container(
        // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),

        // decoration: BoxDecoration(
        //   color: AppColors.white,
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: Transform.scale(
          scale: 2,
          child: Lottie.network(
              "https://lottie.host/48d019ea-f604-45c6-a4f9-afb107e5d3fc/Dmul2oYI9L.json"),
        ),
      ),
      title: PrimaryText(
        text: label!,
        size: 14.0,
        fontWeight: FontWeight.w500,
        color: thirdColor,
      ),
      subtitle: const PrimaryText(
        text: 'Successful',
        size: 12,
        color: AppColors.secondary,
      ),
      trailing: PrimaryText(
        text: amount!,
        size: 16,
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
