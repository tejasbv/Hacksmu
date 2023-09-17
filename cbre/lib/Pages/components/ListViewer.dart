import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/Pages/components/Asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';
import '../../data.dart';
import 'ListWidget.dart';

class ListViewer extends StatefulWidget {
  var _data;
  ListViewer(this._data);

  @override
  State<ListViewer> createState() => _ListViewerState(_data);
}

class _ListViewerState extends State<ListViewer> {
  var _data;
  var list;
  _ListViewerState(this._data) {
    list = _data.map<Widget>((e) => ListWidget(e)).toList();
  }
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
    return Container(
      child: Column(
        children: [
          header(),
          Container(
            height: MediaQuery.of(context).size.height - 500,
            child: SingleChildScrollView(
              child: Column(
                children: list,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Row(
                children: [
                  ElevatedButton(onPressed: null, child: Text("Prev")),
                  Text(
                    "Page: 1",
                    style: TextStyle(color: Colors.blue),
                  ),
                  ElevatedButton(onPressed: null, child: Text("Next")),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
