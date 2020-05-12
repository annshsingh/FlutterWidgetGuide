import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class PaddingWidget extends StatefulWidget {
  @override
  _PaddingWidgetState createState() => _PaddingWidgetState();
}

class _PaddingWidgetState extends State<PaddingWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool isPadding = false;

  @override
  void initState() {
    ///Here lowerBound and upperBound is the value of padding
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 48,
      duration: Duration(seconds: 2),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Padding Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.paddingCode),
              ),
            ),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Column(
            children: <Widget>[
              FlexContainer(color: Colors.yellow, padding: _controller.value),
              Flexible(
                child: Row(
                  children: <Widget>[
                    FlexContainer(color: Colors.green, padding: _controller.value),
                    FlexContainer(color: Colors.blue, padding: _controller.value),
                    FlexContainer(color: Colors.green, padding: _controller.value),
                  ],
                ),
              ),
              FlexContainer(color: Colors.red, padding: _controller.value),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          _controller.value == 0 ? _controller.forward() : _controller.reverse();
          setState(() {
            isPadding ? isPadding = false : isPadding = true;
          });
        },
        label: isPadding ? Text("Remove padding") : Text("Add padding"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class FlexContainer extends StatelessWidget {
  final color;
  final double padding;

  const FlexContainer({Key key, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
