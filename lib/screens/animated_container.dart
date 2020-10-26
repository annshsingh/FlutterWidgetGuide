import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Alignment _alignment = Alignment.center;
  double _animatedHeight = 200.0;
  double _animatedWidth = 400.0;
  double _iconHeight = 180.0;
  double _iconWidth = 180.0;
  Color _animatedColor = Colors.red;
  bool _isAnimated = false;

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
          'Animated Container Widget',
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
                    CodeScreen(code: Code.animatedContainerCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24),
          child: Center(
            ///Animated Container to change the background color with
            ///an animation
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: _animatedWidth,
              height: _animatedHeight,
              color: _animatedColor,
              curve: Curves.fastOutSlowIn,

              ///Animated container that changes the alignment of
              ///FlutterLogo with an animation
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                alignment: _alignment,

                ///Animated Container to change the dimentions of the
                ///FlutterLogo with an animation
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  height: _iconHeight,
                  width: _iconWidth,
                  child: FlutterLogo(
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
          /// Condition to toggle the _isAnimated bool variable
          _animatedWidth == 400.0 ? _isAnimated = true : _isAnimated = false;

          /// Condition to change the alignment of Flutter logo
          _isAnimated
              ? _alignment = Alignment.topCenter
              : _alignment = Alignment.center;

          /// Condition to change the width of the background container
          _isAnimated ? _animatedWidth = 200.0 : _animatedWidth = 400.0;

          /// Condition to change the height of background container
          /// MediaQuery.of(context).size.height - 200 is done to keep
          /// height always above the FAB
          _isAnimated
              ? _animatedHeight = MediaQuery.of(context).size.height - 200
              : _animatedHeight = 200.0;

          /// Condition to change the background color
          _isAnimated
              ? _animatedColor = Colors.lightBlue
              : _animatedColor = Colors.red;

          /// Condition to change the width of FlutterLogo
          _isAnimated ? _iconWidth = 100.0 : _iconWidth = 180.0;

          /// Condition to change the height of FlutterLogo
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
