import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  @override
  _AnimatedPositionedWidgetState createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool showMessage = false;
  String appLink =
      "https://play.google.com/store/apps/details?id=com.annsh.flutterwidgetguide";

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedPositioned Widget',
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
                    CodeScreen(code: Code.animatedPositionedCode),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: <Widget>[
            Container(width: double.infinity, height: 250, color: Colors.blue),
            Positioned(
                bottom: 50,
                right: 50,
                child: RichText(
                    text: TextSpan(

                        /// A default style for all the TextSpans below.
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Colors.black,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                        text: "Click  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                      TextSpan(
                          text: "here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.orange,
                              decoration: TextDecoration.underline,
                              fontSize: 18.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(appLink);
                            }),
                      TextSpan(
                        text: "  to rate the App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                    ]))),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: showMessage ? 100 : 20,
              right: 45,
              child: Container(
                width: 220,
                height: 100,
                color: Colors.blue[900],
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      showMessage ? Icons.arrow_downward : Icons.arrow_upward,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        showMessage
                            ? "Click button below to move me DOWN"
                            : "Click button below to move me UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => setState(() {
          showMessage ? showMessage = false : showMessage = true;
        }),
        icon: Icon(
          Icons.slideshow,
          color: Colors.white,
        ),
        label: Text(
          showMessage ? "Hide Message" : "Reveal Message",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
