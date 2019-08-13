import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class SpacerWidget extends StatefulWidget {
  @override
  _SpacerWidgetState createState() => _SpacerWidgetState();
}

class _SpacerWidgetState extends State<SpacerWidget> {
  bool isSpacerEnabled = true;

  MaterialColor fabColor = Colors.red;

  String fabText = "Remove Spacer";

  IconData fabIcon = Icons.cancel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Spacer Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                  "Empty spaces between the boxes below are Spacer widgets"),
            ),
            Row(
              children: <Widget>[
                /// Empty space with flex = 2
                isSpacerEnabled
                    ? Spacer(
                        flex: 2,
                      )
                    : Container(),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),

                /// Empty space with default flex = 1
                isSpacerEnabled ? Spacer() : Container(),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),

                /// Empty space with default flex = 1
                isSpacerEnabled ? Spacer() : Container(),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                ),

                /// Empty space with default flex = 2
                isSpacerEnabled
                    ? Spacer(
                        flex: 2,
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: fabColor,
        onPressed: () => setState(() {
          isSpacerEnabled == true ? isSpacerEnabled = false : isSpacerEnabled = true;
          isSpacerEnabled ? fabColor = Colors.red : fabColor = Colors.green;
          isSpacerEnabled ? fabIcon = Icons.cancel : fabIcon = Icons.add_circle;
          isSpacerEnabled ? fabText = "Remove Spacer" : fabText = "Add Spacer";
        }),
        icon: Icon(
          fabIcon,
          color: Colors.white,
        ),
        label: Text(
          fabText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
