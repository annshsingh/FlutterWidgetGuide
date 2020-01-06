import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class ContainerWidget extends StatefulWidget {
  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Container Widget',
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
                builder: (context) => CodeScreen(code: Code.containerCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// Simple Container
              Container(
                margin: EdgeInsets.all(24.0),
                color: Colors.blue,
                child: Text(
                  'Container',
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 16.0),
                ),
              ),

              /// Container with Padding
              Container(
                padding: EdgeInsets.all(24.0),
                margin: EdgeInsets.all(24.0),
                color: Colors.blue,
                child: Text(
                  'Container with padding',
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 16.0),
                ),
              ),

              /// Container with a Shape and border
              Container(
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.amber[200],
                  border: Border.all(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Container with shape',
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),

              /// Container with a different shape
              Container(
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber[200],
                ),
                child: Text(
                  'Container with shape',
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),

              /// Container with fixed size
              Container(
                margin: EdgeInsets.all(24.0),
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.amber[200],
                ),
                child: Text(
                  'Container with size',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),

              /// Container with fixed size, rotated a bit
              Container(
                margin: EdgeInsets.all(24.0),
                height: 100,
                width: 100,
                transform: Matrix4.rotationZ(0.15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.amber[200],
                ),
                child: Text(
                  'Container with size rotated',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
