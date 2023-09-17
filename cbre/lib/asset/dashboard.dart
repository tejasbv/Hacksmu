import 'dart:html';
import 'dart:ui';

import 'package:cbre/Pages/components/Topbar.dart';
import 'package:cbre/Pages/components/navigation.dart';
import 'package:cbre/asset/style/colors.dart';
import 'package:cbre/asset/style/style.dart';
import 'package:cbre/constants.dart';
import 'package:flutter/material.dart';

import 'components/bar_chart_component.dart';
import 'components/components.dart';
import 'components/history_table.dart';
import 'config/responsive.dart';
import 'config/size_config.dart';

class AssetView extends StatelessWidget {
  var asset;
  int p;
  AssetView(this.asset, this.p, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  color: secondaryColor,
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.all(Responsive.isDesktop(context) ? 30 : 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 1750,
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage(
                                                    start: p == 2 ? 1 : 0,
                                                  )));
                                    },
                                    child: Container(
                                        width: 100,
                                        height: 100,
                                        child: Icon(Icons.arrow_back))),
                              ),
                              Container(
                                  width: 1000,
                                  padding: EdgeInsets.only(left: 500),
                                  child: TopBar()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Responsive.isDesktop(context)
                              ? SizeConfig.blockSizeVertical! * 5
                              : SizeConfig.blockSizeVertical! * 3,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                        SizedBox(
                          height: Responsive.isDesktop(context)
                              ? SizeConfig.blockSizeVertical! * 4
                              : SizeConfig.blockSizeVertical! * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  text: 'Elevator Travel History',
                                  size: Responsive.isDesktop(context) ? 36 : 14,
                                  color: thirdColor,
                                ),
                              ],
                            ),
                            PrimaryText(
                              text: 'Past 1 year',
                              size: Responsive.isDesktop(context) ? 16 : 14,
                              color: AppColors.secondary,
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        SizedBox(
                          height: 180,
                          child: BarChartComponent(),
                        ),
                        SizedBox(
                          height: Responsive.isDesktop(context)
                              ? SizeConfig.blockSizeVertical! * 5
                              : SizeConfig.blockSizeVertical! * 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            PrimaryText(
                              text: 'History',
                              size: 30.0,
                              fontWeight: FontWeight.w800,
                              color: thirdColor,
                            ),
                            PrimaryText(
                              text: 'Transaction of past 6 months',
                              size: 16,
                              color: thirdColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        // const HistoryTable(),
                        if (!Responsive.isDesktop(context))
                          PaymentsDetailList(asset)
                      ],
                    ),
                  ),
                ),
              ),
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 4,
                  child: Container(
                    height: SizeConfig.screenHeight,
                    color: AppColors.secondaryBg,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          // AppBarActionItem(),
                          PaymentsDetailList(asset),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
