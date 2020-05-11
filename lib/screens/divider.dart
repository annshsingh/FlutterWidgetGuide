import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class DividerWidget extends StatefulWidget {
  @override
  _DividerWidgetState createState() => _DividerWidgetState();
}

class _DividerWidgetState extends State<DividerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Divider Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.dividerCode),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.orange,
            height: 100.0,
            width: 100.0,
          ),
          Divider(
            height: 50,
            thickness: 5,
            color: Colors.blue,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            color: Colors.purple,
            height: 100.0,
            width: 100.0,
          )
        ],
      ),
    );
  }
}
