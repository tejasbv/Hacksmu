import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/Pages/components/Asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../data.dart';
import 'ListWidget.dart';

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  var index = 1;
  var selectall = false;
  get mainColor => null;

  get secondaryColor => null;
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
            child: AutoSizeText(
              "Cost",
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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            Column(
              children: data
                  .sublist((index - 1) * 11, index * 11)
                  .map((e) => ListWidget(e))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Prev")),
                    TextButton(
                        onPressed: (() {
                          setState(() {
                            if (index >= 2) index -= 1;
                          });
                        }),
                        child: Text("Page:" + index.toString())),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index += 1;
                          });
                        },
                        child: Text("Next")),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
