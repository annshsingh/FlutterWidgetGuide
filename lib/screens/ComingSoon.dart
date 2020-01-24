import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class ComingSoon extends StatefulWidget {
  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {

  @override
  void initState() {
    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(24.0),
              child: Icon(
                Icons.build,
                size: 100,
                color: Colors.black87,
              ),
            ),
            Text(
              "Coming soon....",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Utils.ubuntuRegularFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
