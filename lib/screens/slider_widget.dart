import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  ///Initial Slider widget value
  var _value = 1.0;

  var _cupertinoValue = 1.0;

  var _rangeValues = RangeValues(30, 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Slider Widget',
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
                    CodeScreen(code: Code.sliderWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(child: Text("Slider")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _value,

                  ///Color for active side of Slider
                  activeColor: Colors.lightBlue,

                  ///Color for inactive side of Slider
                  inactiveColor: Colors.lightBlue[50],

                  ///Minimum value of the slider
                  min: 1.0,

                  ///Maximum value of the slider
                  max: 100.0,

                  ///No.Of divisions from min to max value on the Slider
                  divisions: 100,

                  ///Value indicator above the slider
                  label: "${_value.round()}",
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(child: Text("Range Slider")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RangeSlider(
                  values: _rangeValues,

                  ///Color for active side of Slider
                  activeColor: Colors.lightBlue,

                  ///Color for inactive side of Slider
                  inactiveColor: Colors.lightBlue[50],

                  ///Minimum value of the slider
                  min: 1.0,

                  ///Maximum value of the slider
                  max: 100.0,

                  ///No.Of divisions from min to max value on the Slider
                  divisions: 100,

                  ///Value indicator above the slider
                  labels: RangeLabels("${_rangeValues.start.round()}", "${_rangeValues.end.round()}"),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _rangeValues = values;
                    });
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(child: Text("Cupertino Slider")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSlider(
                  value: _cupertinoValue,

                  ///Color for active side of Slider
                  activeColor: Colors.lightBlue,

                  ///Minimum value of the slider
                  min: 1.0,

                  ///Maximum value of the slider
                  max: 100.0,

                  ///No.Of divisions from min to max value on the Slider
                  divisions: 100,

                  thumbColor: Colors.lightBlue,

                  onChanged: (double value) {
                    setState(() {
                      _cupertinoValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
