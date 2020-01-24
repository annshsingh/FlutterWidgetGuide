import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class CustomPaintWidget extends StatefulWidget {
  @override
  _CustomPaintWidgetState createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  var _bgColor = Colors.white;
  var _isDarkThemeSet = false;

  @override
  void initState() {
    _getValueFromSP(context);
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
            'CustomPaint Widget',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: Utils.ubuntuRegularFont),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.format_color_fill),
              onPressed: () => setState(() {
                _bgColor == Colors.white
                    ? _bgColor = Colors.black87
                    : _bgColor = Colors.white;
              }),
            ),
            IconButton(
              icon: Icon(Icons.code),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CodeScreen(code: Code.customPaintCode),
                ),
              ),
            )
          ]),
      body: CustomPaint(
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        painter: MyPainter(_bgColor),
      ),
    );
  }

  /// Method to get value from shared preferences
  _getValueFromSP(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('isDarkMode') != null) {
        _isDarkThemeSet = prefs.getBool('isDarkMode');
        _isDarkThemeSet == true
            ? _bgColor = Colors.black87
            : _bgColor = Colors.white;
      } else {
        _isDarkThemeSet = false;
        _isDarkThemeSet == true
            ? _bgColor = Colors.black87
            : _bgColor = Colors.white;
      }
    });
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    /// The .. syntax here is called a cascade.
    /// With cascades, you can perform multiple operations
    /// on the members of a single object
    Paint rectPaint = Paint()..color = color;
    canvas.drawRect(
      rect,
      rectPaint,
    );

    var width = size.width;
    var height = size.height;

    ///canvas.drawLine(Offset(to X, to Y), Offset(from X, from Y), linePaint);

    ///tilt no1
    canvas.drawLine(Offset(width / 2.5, height / 6),
        Offset(width / 20, height / 2), _paint(Colors.amber));

    ///top most line
    canvas.drawLine(Offset(width / 1.7, height / 6),
        Offset(width / 2.5, height / 6), _paint(Colors.red));

    ///coming from top right point to back down to match tilt no1
    ///this is tilt no2
    canvas.drawLine(Offset(width / 6.5, height / 1.7),
        Offset(width / 1.7, height / 6), _paint(Colors.green));

    ///Line joining bottom of tilt one and two
    canvas.drawLine(Offset(width / 6.5, height / 1.7),
        Offset(width / 20, height / 2), _paint(Colors.blue));

    ///parallel line to top most line (joins tilt no3's top and tilt no4's top)
    canvas.drawLine(Offset(width / 2.5, height / 2),
        Offset(width / 1.7, height / 2), _paint(Colors.blue));

    ///tilt no 3
    canvas.drawLine(Offset(width / 2.5, height / 2),
        Offset(width / 4.4, height / 1.5), _paint(Colors.amber));

    ///titl no 4
    canvas.drawLine(Offset(width / 1.7, height / 2),
        Offset(width / 3.1, height / 1.33), _paint(Colors.green));

    ///bottom line joining title no3's bottom and tilt no4's bottom
    canvas.drawLine(Offset(width / 4.4, height / 1.5),
        Offset(width / 2.5, height / 1.2), _paint(Colors.red));

    ///bottom most parallel line
    canvas.drawLine(Offset(width / 1.7, height / 1.2),
        Offset(width / 2.5, height / 1.2), _paint(Colors.amber));

    ///middle line
    canvas.drawLine(Offset(width / 1.7, height / 1.2),
        Offset(width / 3.17, height / 1.72), _paint(Colors.blue));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  _paint(Color color) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;
  }
}
