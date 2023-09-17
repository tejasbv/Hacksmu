import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../data.dart';
import 'components/ListViewer.dart';
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
  @override
  Widget build(BuildContext context) {
    d = [];
    data.forEach(
      (element) {
        if (typeFilter.length != 0 &&
            typeFilter.contains(element["Asset Type"]) &&
            d.length < 25) {
          setState(() {
            d.add(element);
          });
        } else {
          setState(() {
            d = data.sublist((1 - 1) * 25, 1 * 25);
          });
        }
      },
    );
    return Expanded(
        child: Column(
      children: [
        TopBar(),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 1100,
              height: MediaQuery.of(context).size.height - 300,
              child: ListViewer(d),
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
                } else {
                  typeFilter.remove(s);
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
