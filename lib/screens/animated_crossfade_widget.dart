import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  var crossFadeView = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedCrossFade Widget',
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
                    CodeScreen(code: Code.animatedCrossFadeWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              crossFadeState: crossFadeView,
              duration: Duration(milliseconds: 1000),
              firstChild: Container(
                width: 300,
                height: 300,
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    "Flutter Widget Guide",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              secondChild: Container(
                width: 300,
                height: 300,
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    "Is the best :)",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: RaisedButton(
                color: Theme.of(context).backgroundColor,
                child: Text(
                  "Cross Fade",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () => setState(() {
                  crossFadeView = crossFadeView == CrossFadeState.showFirst
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
