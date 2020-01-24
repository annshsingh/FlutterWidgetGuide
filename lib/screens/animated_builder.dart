import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with TickerProviderStateMixin {
  AnimationController _controller1;
  AnimationController _controller2;
  AnimationController _controller3;
  Animation widthAnimation;
  Animation scaleAnimation;

  @override
  void initState() {
    super.initState();

    Ads.hideBannerAd();

    _controller1 = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _controller2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    widthAnimation = Tween(begin: 50.0, end: 300.0).animate(_controller2)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          _controller2.reverse();
        else if (status == AnimationStatus.dismissed) _controller2.forward();
      });

    _controller3 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    scaleAnimation = Tween(begin: 10.0, end: 100.0).animate(_controller3)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          _controller3.reverse();
        else if (status == AnimationStatus.dismissed) _controller3.forward();
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedBuilder Widget',
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
                    CodeScreen(code: Code.animatedBuilderCode),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12),
                    child: AnimatedBuilder(
                      animation: scaleAnimation,
                      child: null,
                      builder: (context, child) => ClipRRect(
                          child: Container(
                            height: scaleAnimation.value,
                            width: scaleAnimation.value,
                            color: Colors.indigo,
                            child: child,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    child: AnimatedBuilder(
                      animation: scaleAnimation,
                      child: null,
                      builder: (context, child) => ClipRRect(
                          child: Container(
                            height: scaleAnimation.value,
                            width: scaleAnimation.value,
                            color: Colors.lightBlue,
                            child: child,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12),
                    child: AnimatedBuilder(
                      animation: _controller1,
                      child: Container(
                          width: 100.0, height: 100.0, color: Colors.lightBlue),
                      builder: (BuildContext context, Widget child) {
                        return Transform.rotate(
                          angle: _controller1.value * 2.0 * math.pi,
                          child: child,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    child: AnimatedBuilder(
                      animation: _controller1,
                      child: Container(
                          width: 100.0, height: 100.0, color: Colors.indigo),
                      builder: (BuildContext context, Widget child) {
                        return Transform.rotate(
                          angle: _controller1.value * 2.0 * math.pi,
                          child: child,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: AnimatedBuilder(
                  animation: widthAnimation,
                  child: null,
                  builder: (context, child) => Container(
                    height: 100,
                    width: widthAnimation.value,
                    color: Colors.indigo,
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => setState(() {
          _controller1.repeat();
          _controller2.forward();
          _controller3.forward();
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
