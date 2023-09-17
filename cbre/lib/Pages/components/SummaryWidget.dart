import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SUmmaryWidget extends StatelessWidget {
  var title;
  var myd;
  SUmmaryWidget(this.title, this.myd, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Card(
          color: Color.fromARGB(255, 117, 46, 121),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: AutoSizeText(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 36.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(left: 10, top: 20),
                      child: AutoSizeText(
                        myd[title][0].toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 36.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 10, top: 20),
                      child: AutoSizeText(
                        myd[title][1].toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 36.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 10, top: 20),
                    child: AutoSizeText(
                      myd[title][2].toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 10, top: 20),
                    child: AutoSizeText(
                      myd[title][3].toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
