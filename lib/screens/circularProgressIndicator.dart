import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class CircularProgressIndicatorWidget extends StatefulWidget {
  @override
  _CircularProgressIndicatorWidgetState createState() => _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState extends State<CircularProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;
  var counterStream =
      Stream<double>.periodic(Duration(milliseconds: 100), (x) => (x / 100).toDouble()).take(101);

  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    _colorTween = _animationController.drive(ColorTween(begin: Colors.green, end: Colors.red));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ProgressIndicator Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.progressIndicatorCode),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ///CircularProgressIndicator with a value
          StreamBuilder(
            stream: counterStream,
            builder: (context, snapshot) {
              print(snapshot.data);
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: snapshot.data,
                ),
              );
            },
          ),

          ///CircularProgressIndicator with single color
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),

          ///CircularProgressIndicator with dual color
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircularProgressIndicator(valueColor: _colorTween),
          ),

          ///LinearProgressIndicator with dual color
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: LinearProgressIndicator(valueColor: _colorTween),
          ),
        ],
      ),
    );
  }
}
