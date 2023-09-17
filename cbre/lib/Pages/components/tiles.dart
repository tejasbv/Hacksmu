import 'package:cbre/Pages/components/hoverWidget.dart';
import 'package:cbre/data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../constants.dart';

class Tile extends StatefulWidget {
  var val;
  var dt = [];
  Tile(this.val) {
    data.forEach((element) {
      if (element["Asset Type"] == val && dt.length < 10) {
        dt.add(element);
      }
    });
  }
  _TileState createState() => _TileState(dt);
}

class _TileState extends State<Tile> {
  bool isHover = false;
  var dt = [];
  List<Widget> list = [];
  _TileState(this.dt) {
    dt.forEach((element) {
      list.add(HoveringWidget(element));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 250,
        height: MediaQuery.of(context).size.height - 250,
        padding: EdgeInsets.only(left: 50, right: 50),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 20),
            children: list));
  }
}
