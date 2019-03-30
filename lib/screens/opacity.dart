import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class OpacityWidget extends StatefulWidget {
  @override
  _OpacityWidgetState createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  var _value = 0.50;
  var _animOpacityValue = 1.0;
  var _bgColor = Colors.black87;
  var _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'Opacity Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    'Without Animation',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Utils.ubuntuRegularFont),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Text(
                    'Slide the slider widget to change the value of opacity\n'
                        'to observe changes on the widget with gradient',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: Utils.ubuntuRegularFont),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  child: FlutterLogo(
                    colors: Colors.lightBlue,
                    textColor: Colors.white,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: Opacity(
                    opacity: _value,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blueAccent, Colors.white]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Slider(
              value: _value,
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.lightBlue[50],
              min: 0.0,
              max: 1.0,
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            const Text('Drag to change opacity'),
            divider(context),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    'With Animation',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Utils.ubuntuRegularFont),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Text(
                    'Click on the widget below to observe changes in opacity of the\n'
                        'text widget with Animation',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: Utils.ubuntuRegularFont),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: _bgColor),
                    child: AnimatedOpacity(
                      opacity: _animOpacityValue,
                      duration: Duration(seconds: 1),
                      child: Text(
                        "Click here to toggle Animation",
                        style: TextStyle(
                            color: _textColor,
                            fontSize: 15.0,
                            fontFamily: Utils.ubuntuRegularFont),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () => setState(() {
                    _animOpacityValue == 1.0
                        ? _animOpacityValue = 0.0
                        : _animOpacityValue = 1.0;
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container divider(BuildContext context) => Container(
  height: 1,
  width: MediaQuery.of(context).size.width,
  color: Colors.grey[350],
  margin: EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 28),
);
