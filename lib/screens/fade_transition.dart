import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class FadeTransitionWidget extends StatefulWidget {
  @override
  _FadeTransitionWidgetState createState() => _FadeTransitionWidgetState();
}


class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  CurvedAnimation _curve;

  @override
  void initState() {

    ///An animation controller lets you control the
    ///duration of an animation
    ///Here the ticker for vsync provider is provided
    ///by the SingleTickerProviderStateMixin
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    ///Providing our animation with a curve (Parent here is the controller
    ///above)
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    ///Creating a Tween animation with start and end values for the
    ///opacity and providing it with our animation controller
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_curve);

    ///Set a status listener to our animation to control the behaviour
    ///of our animation
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _controller.reverse();
      else if (status == AnimationStatus.dismissed) _controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    ///Don't forget to clean up resources when you are done using it
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'Fade Transition Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
      ),
      body: Center(
        child: FadeTransition(
          ///Providing our animation to opacity property
          opacity: _animation,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 300,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        onPressed: () => setState(() {
              ///We start the animation by calling this
              _controller.forward();
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
