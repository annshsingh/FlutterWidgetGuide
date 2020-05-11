import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class BuilderWidget extends StatefulWidget {
  @override
  _BuilderWidgetState createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Builder Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.builderCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Click me"),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("I was created using context of a builder and not a scaffold key"),
                    action: SnackBarAction(
                      textColor: Colors.yellow,
                      label: 'OK',
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
