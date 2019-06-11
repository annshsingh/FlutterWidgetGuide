import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class StreamBuilderWidget extends StatefulWidget {
  @override
  _StreamBuilderWidgetState createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  ///Preparing a stream of data where a double will be emitted every 100 milliseconds
  ///till the value reaches 101.
  var counterStream = Stream<double>.periodic(
      Duration(milliseconds: 100), (x) => (x * 2).toDouble()).take(101);
  bool _isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'StreamBuilder Widget',
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
                        CodeScreen(code: Code.streamBuilderCode),
                  ),
                ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: StreamBuilder(
            stream: _isButtonClicked ? counterStream : null,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
//                  margin: EdgeInsets.all(12),
//                  child: CircularProgressIndicator(
//                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                  ),
                    );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(24),
                    height: snapshot.data,
                    width: snapshot.data,
                    color: Colors.indigo,
                  ),
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(6),
                          child: Text(
                            "Height: ${snapshot.data}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6),
                          child: Text(
                            "Width: ${snapshot.data}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: _isButtonClicked == false
            ? () {
                ///You need to reset UI by calling setState.
                setState(() {
                  _isButtonClicked == false
                      ? _isButtonClicked = true
                      : _isButtonClicked = false;
                });
              }
            : null,
        icon: Icon(
          Icons.linear_scale,
          color: Colors.white,
        ),
        label: Text(
          "Start Stream",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
