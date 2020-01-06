import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class FractionallySizedBoxWidget extends StatefulWidget {
  @override
  _FractionallySizedBoxWidgetState createState() =>
      _FractionallySizedBoxWidgetState();
}

class _FractionallySizedBoxWidgetState
    extends State<FractionallySizedBoxWidget> {
  ///Initial Slider widget value
  var _value = 0.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FractionallySizedBox Widget',
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
                    CodeScreen(code: Code.fractionallySizedBoxCode),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              widthFactor: _value,
              heightFactor: 0.5,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.0),
            child: Text("Width factor is : ${_value.abs()}"),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Text(
                "Covering ${(_value * 100).toStringAsFixed(0)}% of device width"),
          ),

          ///Slider widget to set opacity value
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Slider(
              value: _value,

              ///Color for active side of Slider
              activeColor: Colors.lightBlue,

              ///Color for inactive side of Slider
              inactiveColor: Colors.lightBlue[50],

              ///Minimum value of the slider
              min: 0.0,

              ///Maximum value of the slider
              max: 1.0,

              ///No.Of divisions from min to max value on the Slider
              divisions: 100,

              ///Value indicator above the slider
              label: "${_value.abs()}",
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
          Text('Drag to change width factor'),
        ],
      ),
    );
  }
}
