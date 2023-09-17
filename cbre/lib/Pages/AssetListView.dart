import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'components/ListViewer.dart';
import 'components/Topbar.dart';

class AssetListView extends StatefulWidget {
  const AssetListView({super.key});

  @override
  State<AssetListView> createState() => _AssetListViewState();
}

class _AssetListViewState extends State<AssetListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TopBar(),
          Container(
            width: MediaQuery.of(context).size.width - 1100,
            height: MediaQuery.of(context).size.height - 250,
            child: ListViewer(),
          )
        ],
      ),
    );
  }
}
