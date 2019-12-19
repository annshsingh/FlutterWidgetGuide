import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' as painting;
import 'package:flutter_widget_guide/utils.dart';
import 'package:transparent_image/transparent_image.dart';

import '../Code.dart';
import '../CodeScreen.dart';

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
        centerTitle: true,
        title: Text(
          'FadeInImage Widget',
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
                    builder: (context) =>
                        CodeScreen(code: Code.fadeInImageCode),
                  ),
                ),
          )
        ],
      ),

      ///Will pop scope is used to detect if the user pressed back button
      body: WillPopScope(
        child: Stack(children: <Widget>[
          ///We can choose to show an indicator as well to let user know that
          ///something is being loaded
          Center(
              child: CircularProgressIndicator(

                  ///this is to specify the color of the CircularProgressIndicator
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
          Center(
            child: Container(
              child: FadeInImage.memoryNetwork(

                  ///Specifying dimensions of the image before and after
                  ///loading
                  height: 350,
                  width: 350,

                  ///we are using the transparent_image package
                  ///to show a transparent image as a placeholder.
                  placeholder: kTransparentImage,
                  image: _url),
            ),
          ),
        ]),
        onWillPop: _willPopCallback,
      ),
    );
  }
}

Future<bool> _willPopCallback() async {
  ///clear image cache and exit screen
  ///this is done so that the image loads every time you open the
  ///screen. (it is cached otherwise)
  painting.imageCache.clear();
  return true; // return true if the route to be popped
}

