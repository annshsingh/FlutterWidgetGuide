import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class PositionedWidget extends StatefulWidget {
  @override
  _PositionedWidgetState createState() => _PositionedWidgetState();
}

class _PositionedWidgetState extends State<PositionedWidget> {
  var _topPosition = 20.0;
  var _leftPosition = 20.0;

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
          'Positioned Widget',
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
                builder: (context) => CodeScreen(code: Code.positionedCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  height: 300,
                  color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: _topPosition,
                  left: _leftPosition,
                  width: 50,
                  height: 50,
                  child: FlutterLogo(
                    colors: Colors.lightBlue,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Drag the slider below to change the value of position of Flutter widget'
                ' from the top of the container',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
            ),
            Container(
              child: Slider(
                value: _topPosition,
                activeColor: Colors.lightBlue,
                inactiveColor: Colors.lightBlue[50],
                min: 20.0,
                max: 250.0,
                divisions: 100,
                label: '${_topPosition.round()}',
                onChanged: (double value) {
                  setState(() {
                    _topPosition = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Drag the slider below to change the value of position of Flutter widget'
                ' from the left of the container',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
            ),
            Container(
              child: Slider(
                value: _leftPosition,
                activeColor: Colors.lightBlue,
                inactiveColor: Colors.lightBlue[50],
                min: 20.0,
                max: (MediaQuery.of(context).size.width) - 60.0,
                divisions: 100,
                label: '${_leftPosition.round()}',
                onChanged: (double value) {
                  setState(() {
                    _leftPosition = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
