import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' as painting;
import 'package:flutter_widget_guide/utils.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImageWidget extends StatefulWidget {
  @override
  _FadeInImageWidgetState createState() => _FadeInImageWidgetState();
}

class _FadeInImageWidgetState extends State<FadeInImageWidget> {
  String _url =
      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'FadeInImage Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
      ),
      ///Will pop scope is used to detect if the user pressed back button
      body: WillPopScope(
        child: Stack(children: <Widget>[
          Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
          Center(
            child: Container(
              child: FadeInImage.memoryNetwork(
                  height: 350,
                  width: 350,
                  placeholder: kTransparentImage,
                  image: _url),
            ),
          ),
        ]),
        onWillPop: () {
          ///clear image cache and exit screen
          ///this is done so that the image loads everytime you open the
          ///screen.
          painting.imageCache.clear();
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
