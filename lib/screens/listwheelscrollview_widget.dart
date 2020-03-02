import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class ListWheelScrollViewWidget extends StatefulWidget {
  @override
  _ListWheelScrollViewWidgetState createState() =>
      _ListWheelScrollViewWidgetState();
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {
  ///Initial Slider widget value
  var _value = 0.0;

  final List<Widget> entries = List<Widget>.generate(
    15,
    (i) => Card(
      color: Utils.getRandomColor(),
      child: Center(
        child: Text(
          "Item ${i + 1}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );

  @override
  void initState() {
    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ListWheelScrollView Widget',
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
                    CodeScreen(code: Code.listWheelScrollViewWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 8,
            child: ListWheelScrollView(
              children: entries,
              itemExtent: 100,
              offAxisFraction: _value,
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Text(
                "Drag to change offAxisFraction value",
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Slider(
              value: _value,

              ///Color for active side of Slider
              activeColor: Colors.lightBlue,

              ///Color for inactive side of Slider
              inactiveColor: Colors.lightBlue[50],

              ///Minimum value of the slider
              min: -1.0,

              ///Maximum value of the slider
              max: 1.0,

              ///No.Of divisions from min to max value on the Slider
              divisions: 100,

              ///Value indicator above the slider
              label: "${_value.toStringAsFixed(2)}",
              onChanged: (double value) {
                setState(
                  () {
                    _value = value;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
