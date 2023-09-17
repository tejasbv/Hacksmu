import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/Pages/WorkOrder.dart';
import 'package:cbre/constants.dart';
import 'package:cbre/data.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

import '../AssetListView.dart';
import '../Dashboard.dart';

/// Flutter code sample for [NavigationBar].

class HomePage extends StatelessWidget {
  final start;
  const HomePage({this.start = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageExample(start));
  }
}

class HomePageExample extends StatefulWidget {
  final start;
  HomePageExample(this.start, {super.key});

  @override
  State<HomePageExample> createState() => _HomePageExampleState(start);
}

class _HomePageExampleState extends State<HomePageExample> {
  int selectedIndex;

  _HomePageExampleState(this.selectedIndex);

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    // TODO: implement initState

    data.sort((a, b) => int.parse(a["Naïve Prediction of Days"].toString())
        .compareTo(int.parse(b["Naïve Prediction of Days"].toString())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Row(
        children: [
          Container(
            width: 500,
            child: SideNavigationBar(
              initiallyExpanded: true,
              selectedIndex: selectedIndex,
              header: SideNavigationBarHeader(
                  image: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      minRadius: 40,
                      backgroundColor: primaryColor,
                      child: Icon(
                        color: mainColor,
                        Icons.account_balance,
                      ),
                    ),
                  ),
                  title: Container(
                      height: 200,
                      child: const Center(
                        child: AutoSizeText(
                          "Tejas B.",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )),
                  // subtitle: const Center(
                  //   child: AutoSizeText(
                  //     "800 W Campbell rd, Richardson, TX - 75080",
                  //     maxLines: 2,
                  //     style: TextStyle(
                  //       color: thirdColor,
                  //       fontSize: 8.0,
                  //       fontWeight: FontWeight.w900,
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  subtitle: Container()),
              items: const [
                SideNavigationBarItem(
                  icon: Icons.dashboard,
                  label: 'Maintenance Dashboard',
                ),
                SideNavigationBarItem(
                  icon: Icons.videogame_asset_sharp,
                  label: 'Asset List',
                ),
                SideNavigationBarItem(
                  icon: Icons.schedule,
                  label: 'Previous Work Orders',
                ),
                SideNavigationBarItem(
                  icon: Icons.money,
                  label: 'Budget Management',
                ),
                SideNavigationBarItem(
                  icon: Icons.handyman_sharp,
                  label: 'Technician List',
                ),
                SideNavigationBarItem(
                  icon: Icons.settings,
                  label: 'Settings',
                ),
              ],
              theme: SideNavigationBarTheme(
                togglerTheme: SideNavigationBarTogglerTheme.standard(),
                itemTheme: SideNavigationBarItemTheme(
                    iconSize: 40,
                    labelTextStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600)),
                dividerTheme: const SideNavigationBarDividerTheme(
                    headerDividerThickness: 10000,
                    showHeaderDivider: true,
                    showMainDivider: true,
                    showFooterDivider: false),
              ),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          selectedIndex == 0
              ? Dashboard()
              : selectedIndex == 1
                  ? AssetListView()
                  : selectedIndex == 2
                      ? WorkOrder()
                      : Container()
        ],
      ),
    );
  }
}
