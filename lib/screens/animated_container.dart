import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  var _alignment = Alignment.center;
  var _animatedHeight = 200.0;
  var _animatedWidth = 400.0;
  var _iconHeight = 180.0;
  var _iconWidth = 180.0;
  var _animatedColor = Colors.red;
  var _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'Animated Container Widget',
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
        child: Container(
          margin: EdgeInsets.only(top: 24),
          child: Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: _animatedWidth,
              height: _animatedHeight,
              color: _animatedColor,
              curve: Curves.fastOutSlowIn,
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                alignment: _alignment,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  height: _iconHeight,
                  width: _iconWidth,
                  child: FlutterLogo(
                    colors: Colors.amber,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => setState(() {
              _animatedWidth == 400.0
                  ? _isAnimated = true
                  : _isAnimated = false;
              _isAnimated
                  ? _alignment = Alignment.topCenter
                  : _alignment = Alignment.center;
              _isAnimated ? _animatedWidth = 200.0 : _animatedWidth = 400.0;
              _isAnimated
                  ? _animatedHeight = MediaQuery.of(context).size.height - 200
                  : _animatedHeight = 200.0;
              _isAnimated
                  ? _animatedColor = Colors.lightBlue
                  : _animatedColor = Colors.red;
              _isAnimated ? _iconWidth = 100.0 : _iconWidth = 180.0;
              _isAnimated ? _iconHeight = 100.0 : _iconHeight = 180.0;
            }),
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
        label: Text(
          "Animate",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
