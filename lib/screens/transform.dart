import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class TransformWidget extends StatefulWidget {
  @override
  _TransformWidgetState createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  var _scale = 1.0;
  var _angle = 0.0;
  var _xValue = 0.0;

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
        title: Container(
          child: Text(
            'Transform Widget',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: Utils.ubuntuRegularFont),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.transformCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Transform.scale(
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Change my scale",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: Utils.ubuntuRegularFont),
                    ),
                  ),
                ),
                scale: _scale,
              ),
              Slider(
                value: _scale,
                activeColor: Colors.lightBlue,
                inactiveColor: Colors.lightBlue[50],
                min: 0.5,
                max: 1.0,
                divisions: 10,
                label: '${_scale.abs()}',
                onChanged: (double value) {
                  setState(() {
                    _scale = value;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  'Drag the slider above to change the scale.\nObserve how the'
                  'size of the widget varies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: Utils.ubuntuRegularFont),
                ),
              ),
              Transform.rotate(
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Rotate me",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: Utils.ubuntuRegularFont),
                    ),
                  ),
                ),
                angle: _angle * 0.0174,
              ),
              Slider(
                value: _angle,
                activeColor: Colors.lightBlue,
                inactiveColor: Colors.lightBlue[50],
                min: 0.0,
                max: 180.0,
                divisions: 100,
                label: '${_angle.truncate()}',
                onChanged: (double value) {
                  setState(() {
                    _angle = value;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  'Drag the slider above to change the angle.\nObserve how the'
                  'widget rotates',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: Utils.ubuntuRegularFont),
                ),
              ),
              Transform.translate(
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Shift me",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: Utils.ubuntuRegularFont),
                    ),
                  ),
                ),
                offset: Offset(_xValue, 0.0),
              ),
              Slider(
                value: _xValue,
                activeColor: Colors.lightBlue,
                inactiveColor: Colors.lightBlue[50],
                min: -100.0,
                max: 100.0,
                divisions: 100,
                label: '${_xValue.truncate()}',
                onChanged: (double value) {
                  setState(() {
                    _xValue = value;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  'Drag the slider above to change the horizontal component [dx].\nObserve how the'
                  'widget slides along the horizontal axis',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: Utils.ubuntuRegularFont),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
