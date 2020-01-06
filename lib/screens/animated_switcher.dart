import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  @override
  _AnimatedSwitcherWidgetState createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool switched = false;

  Widget _myAnimatedWidget = Container(
    /// Add unique key to the widgets if they are same
    /// In this case all 3 are Container Widgets
    key: ValueKey(1),
    width: 250.0,
    height: 250.0,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedSwitcher Widget',
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
                    CodeScreen(code: Code.animatedSwitcherCode),
              ),
            ),
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: AnimatedSwitcher(
                duration: Duration(seconds: 1),

                /// Various other animations available
                /// Here we have used the Scale animation
                /// By default, a FadeTransiton will appear between two widgets
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        ScaleTransition(
                          child: child,
                          scale: animation,
                        ),
                child: _myAnimatedWidget),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => setState(() {
          _myAnimatedWidget = switched
              ? Container(
                  /// Add unique key to the widgets if they are same
                  key: ValueKey(2),
                  width: 250.0,
                  height: 250.0,
                  color: Colors.blue,
                )
              : Container(
                  /// Add unique key to the widgets if they are same
                  key: ValueKey(3),
                  width: 250.0,
                  height: 250.0,
                  color: Colors.red,
                );
          switched ? switched = false : switched = true;
        }),
        icon: Icon(
          Icons.swap_horiz,
          color: Colors.white,
        ),
        label: Text(
          "Switch Widgets",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
