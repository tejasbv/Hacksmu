import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
import '../data.dart';
import 'components/ListViewer.dart';
import 'components/ListWidget.dart';
import 'components/Topbar.dart';

class AssetListView extends StatefulWidget {
  const AssetListView({super.key});

  @override
  State<AssetListView> createState() => _AssetListViewState();
}

class _AssetListViewState extends State<AssetListView> {
  var index = 1;
  var d = data.sublist((1 - 1) * 25, 1 * 25);
  var typeFilter = [];
  var selectall = false;

  Widget header() {
    return Column(children: [
      Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Transform.scale(
              scale: 2,
              child: Checkbox(
                value: selectall,
                onChanged: (value) {
                  setState(() {
                    selectall = value!;
                  });
                },
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
            child: Center(
              child: AutoSizeText(
                "Image",
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 36.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 100,
            padding: EdgeInsets.only(right: 10),
            child: AutoSizeText(
              "ID",
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
              "Asset Type",
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
              "Last Service",
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
              "Criticality",
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
            child: const AutoSizeText(
              "Cost",
              maxLines: 1,
              style: TextStyle(
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
              "Next Service",
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

  @override
  Widget build(BuildContext context) {
    print(d);
    return Expanded(
        child: Column(
      children: [
        TopBar(),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 1100,
              height: MediaQuery.of(context).size.height - 300,
              child: Container(
                child: Column(
                  children: [
                    header(),
                    Container(
                      height: MediaQuery.of(context).size.height - 500,
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              d.map<Widget>((e) => ListWidget(e)).toList(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: null, child: Text("Prev")),
                            Text(
                              "Page: 1",
                              style: TextStyle(color: Colors.blue),
                            ),
                            ElevatedButton(
                                onPressed: null, child: Text("Next")),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50),
              width: MediaQuery.of(context).size.width - 1900,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 2000,
                    child: const AutoSizeText(
                      "Filter",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 2000,
                    child: const AutoSizeText(
                      "Type:",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 24.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 2000,
                    child: Column(
                      children: types
                          .map<Widget>((e) => builTypeFilter("$e"))
                          .toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }

  builTypeFilter(String s) {
    return Row(
      children: [
        Checkbox(
            value: typeFilter.contains(s),
            onChanged: ((value) {
              setState(() {
                if (value!) {
                  typeFilter.add(s);
                  d = [];

                  data.forEach(
                    (element) {
                      if (typeFilter.length != 0 &&
                          typeFilter.contains(element["Asset Type"]) &&
                          d.length <= 25) {
                        setState(() {
                          d.add(element);
                        });
                      } else if (typeFilter.length == 0) {
                        setState(() {
                          d = data.sublist((1 - 1) * 25, 1 * 25);
                        });
                      }
                    },
                  );
                } else {
                  typeFilter.remove(s);
                  d = [];
                  data.forEach(
                    (element) {
                      if (typeFilter.length != 0 &&
                          typeFilter.contains(element["Asset Type"]) &&
                          d.length <= 25) {
                        setState(() {
                          d.add(element);
                        });
                      } else if (typeFilter.length == 0) {
                        setState(() {
                          d = data.sublist((1 - 1) * 25, 1 * 25);
                        });
                      }
                    },
                  );
                }
              });
            })),
        AutoSizeText(
          s,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white60,
            fontSize: 24.0,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
