import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class ReorderableListViewWidget extends StatefulWidget {
  @override
  _ReorderableListViewWidgetState createState() => _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ReorderableListView Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Colors.white,
            child: Text(
              "This widget will be added soon",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
        ),
      ),
    );
  }
}
