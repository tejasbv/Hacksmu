import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbre/Pages/components/Topbar.dart';
import 'package:cbre/constants.dart';
import 'package:cbre/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import 'components/tiles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Widget buildItem(String text) {
      return Card(
        key: ValueKey(text),
        elevation: 6,
        shadowColor: mainColor,
        color: thirdColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: AutoSizeText(
                text,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 975,
                child: Tile(text)),
          ],
        )),
      );
    }

    return Expanded(
        child: Column(
      children: [
        TopBar(),
        Container(
          width: MediaQuery.of(context).size.width - 250,
          height: MediaQuery.of(context).size.height - 250,
          padding: EdgeInsets.only(left: 50, right: 50),
          child: ReorderableGridView.count(
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            crossAxisCount: 3,

            onReorder: (oldIndex, newIndex) {
              setState(() {
                final element = types.removeAt(oldIndex);
                types.insert(newIndex, element);
              });
            },
            // footer: const  [
            //   Card(
            //     child: Center(
            //       child: Icon(Icons.add),
            //     ),
            //   ),
            // ],
            children: types.map((e) => buildItem("$e")).toList(),
          ),
        ),
      ],
    ));
  }
}
