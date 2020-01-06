import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class OpacityWidget extends StatefulWidget {
  @override
  _OpacityWidgetState createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  ///Initial Slider widget value
  var _value = 0.50;

  ///Initial AnimatedOpacity widget value
  var _animOpacityValue = 1.0;

  var _bgColor = Colors.black87;
  var _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Opacity Widget',
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
                builder: (context) => CodeScreen(code: Code.opacityCode),
              ),
            ),
          )
        ],
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
                        color: Theme.of(context).backgroundColor,
                        fontSize: 18.0,
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

            ///Stack widget to blend FlutterLogo widget with a container
            ///with varying opacity controlled by a Slider Widget
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

            ///Slider widget to set opacity value
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Slider(
                value: _value,

                ///Color for active side of Slider
                activeColor: Colors.lightBlue,

                ///Color for inactive side of Slider
                inactiveColor: Colors.lightBlue[50],

                ///Minimum value of the slider
                min: 0.0,

                ///Maximum value of the slider
                max: 1.0,

                ///No.Of divisions from min to max value on the Slider
                divisions: 100,

                ///Value indicator above the slider
                label: "${_value.abs()}",
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
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
                        color: Theme.of(context).backgroundColor,
                        fontSize: 18.0,
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

                ///Widget to make a Container detect clicks
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: _bgColor),

                    ///Widget to animate the change in opacity
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
      child: Divider(),
      margin: EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 28),
    );
