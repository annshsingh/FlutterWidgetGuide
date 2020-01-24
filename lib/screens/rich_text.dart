import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class RichTextWidget extends StatefulWidget {
  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {

  @override
  void initState() {
    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RichText Widget',
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
                builder: (context) => CodeScreen(code: Code.richTextCode),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RichText(
          text: TextSpan(
            /// A default style for all the TextSpans below.
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
              color: Theme.of(context).backgroundColor,
              height: 1.5,
            ),
            children: <TextSpan>[
              TextSpan(text: "This is a normal text "),
              TextSpan(
                text: "which suddenly switches to a bold text ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              TextSpan(
                text:
                    "which is now italic as well. But what if it was colored ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0),
              ),
              TextSpan(
                text: "like this text. ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    fontSize: 14.0),
              ),
              TextSpan(
                text: "Might as well underline it.\n",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    fontSize: 14.0),
              ),
              TextSpan(
                text:
                    "Let us now increase the font size so that you can read it properly.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    fontSize: 18.0),
              ),
              TextSpan(
                text: "\n\nI wonder what more can we do before ending this. ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    fontSize: 18.0),
              ),
              TextSpan(
                text:
                    "Oh yes, Let's give this text a background color to highlight it",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    backgroundColor: Colors.yellowAccent,
                    fontSize: 18.0),
              ),
              TextSpan(
                text: "\n\nOne more thing, You can add links as well. Click ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    fontSize: 18.0),
              ),
              TextSpan(
                  text: "here",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      fontSize: 18.0),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          "https://github.com/annshsingh/flutter-widget-guide");
                    }),
              TextSpan(
                text: " to see how it works",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
