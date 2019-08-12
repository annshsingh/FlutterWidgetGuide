import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class SpacerWidget extends StatefulWidget {
  @override
  _SpacerWidgetState createState() => _SpacerWidgetState();
}

class _SpacerWidgetState extends State<SpacerWidget> {
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
          child: Row(
        children: <Widget>[
          /// Empty space with flex = 2
          Spacer(
            flex: 2,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
          /// Empty space with default flex = 1
          Spacer(),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          /// Empty space with default flex = 1
          Spacer(),
          Container(
            height: 100,
            width: 100,
            color: Colors.orange,
          ),
          /// Empty space with default flex = 2
          Spacer(
            flex: 2,
          ),
        ],
      )),
    );
  }
}
