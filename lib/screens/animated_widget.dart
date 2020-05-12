import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class AnimatedWidgett extends StatefulWidget {
  @override
  _AnimatedWidgettState createState() => _AnimatedWidgettState();
}

class _AnimatedWidgettState extends State<AnimatedWidgett> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      lowerBound: 1,
      upperBound: 12,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedWidget Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.animatedWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///We pass the controller for width and controller params
            ///The width one will be used to get the value and will act
            ///as a listenable for the Animated Widget
            ButtonTransition(width: _controller, controller: _controller),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ButtonTransition extends AnimatedWidget {
  ///We make a getter for the Animation value and use the listenable
  ///to do just that
  Animation<double> get _width => listenable;

  final AnimationController controller;

  const ButtonTransition({width, this.controller}) : super(listenable: width);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        controller.isAnimating ? controller.stop() : controller.repeat(reverse: true);
      },
      borderSide: BorderSide(
        width: _width.value,
      ),
      child: Container(
        height: 50,
        width: 80,
        child: Center(
          child: Text("Click Me!"),
        ),
      ),
    );
  }
}
