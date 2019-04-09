import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_widget_guide/utils.dart';

class Hero2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'Hero 2 Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
      ),
      body: WillPopScope(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: "hero",
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(12),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      child: Container(
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.circular(0),
                      clipBehavior: Clip.antiAlias,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        child: FlutterLogo(
                          colors: Colors.lightBlue,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onWillPop: () {
          timeDilation = 4.0;
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
