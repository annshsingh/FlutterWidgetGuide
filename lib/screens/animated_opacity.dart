import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double opacityLevel = 1.0;
  String buttonText = "Fade Out";

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
          'AnimatedOpacity Widget',
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
                    CodeScreen(code: Code.animatedOpacityCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 1),
                child: FlutterLogo(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Text("Opacity Value - ${opacityLevel.toString()}"),
            ),
            Container(
              child: RaisedButton(
                color: Theme.of(context).backgroundColor,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: _changeOpacity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      buttonText = buttonText == "Fade Out" ? "Fade In" : "Fade Out";
    });
  }
}
