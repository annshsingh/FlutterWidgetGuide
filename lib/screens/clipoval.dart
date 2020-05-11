import 'dart:math';
import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class ClipOvalWidget extends StatefulWidget {
  @override
  _ClipOvalWidgetState createState() => _ClipOvalWidgetState();
}

class _ClipOvalWidgetState extends State<ClipOvalWidget> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ClipOval Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.clipOvalCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder(
              ///Rest the tween range on number change
              tween: number.isEven
                  ? Tween<double>(begin: 0.5, end: 1.0)
                  : Tween<double>(begin: 1.0, end: 0.5),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              builder: (context, tweenValue, child) {
                ///This will clip the chile i.e. the Yellow container
                return ClipOval(
                  clipBehavior: Clip.antiAlias,
                  ///Custom clipper here in which we pass the tweenvalue
                  ///to behave as a radius and thus help modify the size of the
                  ///Rect in the clipper.
                  clipper: MyCircleClipper(tweenValue),
                  child: Transform.scale(
                    scale: 2 - tweenValue,
                    ///A simple way to rotate a widget
                    child: Transform.rotate(
                      child: child,
                      angle: tweenValue + number/2,
                    ),
                  ),
                );
              },
              child: Container(
                height: 200.0,
                width: 200.0,
                color: Colors.yellow,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              onEnd: () {
                ///Update the number on every animation end
                setState(() {
                  number++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyCircleClipper extends CustomClipper<Rect> {
  final double radius;

  MyCircleClipper(this.radius);

  @override
  Rect getClip(Size size) {
    ///Here size is the size of the widget over which this ClipOval is wrapped
    ///So here, height and width are 200.0
    var smaller = min(size.width, size.height);
    return Rect.fromCenter(
      center: size.center(Offset.zero),
      width: smaller * radius,
      height: smaller * radius,
    );
  }

  @override
  bool shouldReclip(MyCircleClipper oldClipper) {
    return radius != oldClipper.radius;
  }
}
