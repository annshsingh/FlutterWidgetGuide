import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  @override
  _AnimatedPaddingWidgetState createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double padValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedPadding Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.animatedPaddingCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: Duration(seconds: 1),
              child: Container(height: 150, width: 150, color: Colors.blue),
            ),
            AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: Duration(seconds: 1),
              child: Container(height: 150, width: 150, color: Colors.red),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => setState(() {
          padValue == 0 ? padValue = 10 : padValue = 0;
        }),
        label: Text(
          padValue == 0 ? "Add Padding" : "Remove Padding",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
