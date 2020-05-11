import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class CupertinoActivityIndicatorWidget extends StatefulWidget {
  @override
  _CupertinoActivityIndicatorWidgetState createState() => _CupertinoActivityIndicatorWidgetState();
}

class _CupertinoActivityIndicatorWidgetState extends State<CupertinoActivityIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CupertinoActivityIndicator Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.cupertinoActivityIndicatorCode),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ///Default indicator
            CupertinoActivityIndicator(),
            ///Default indicator with no animation
            CupertinoActivityIndicator(
              animating: false,
            ),
            ///Default indicator with increased size
            CupertinoActivityIndicator(
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
