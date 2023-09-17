import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'hero_text.dart';
import 'serving_items_list.dart';

class DesktopHero extends StatelessWidget {
  const DesktopHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.07),
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Expanded(
                      child: HeroText(),
                    ),
                    Expanded(
                      flex: 2,
                      child: HeroImage(),
                    ),
                    Expanded(
                      child: _ServingItems(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServingItems extends StatelessWidget {
  const _ServingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return servingItems[index];
      },
      separatorBuilder: (context, _) {
        return const SizedBox(height: 40.0);
      },
      itemCount: servingItems.length,
      shrinkWrap: true,
    );
  }
}
