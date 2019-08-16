import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class LimitedBoxWidget extends StatefulWidget {
  @override
  _LimitedBoxWidgetState createState() => _LimitedBoxWidgetState();
}

class _LimitedBoxWidgetState extends State<LimitedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'LimitedBox Widget',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: Utils.ubuntuRegularFont),
          ),
        ),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? portraitLayout(context)
            : landscapeLayout(context));
  }
}

Widget portraitLayout(context) => ListView(
      children: <Widget>[
        /// The size of the container is 0 in unconstrained environment
        /// So Wrapping it with a LimitedBox will force its bounds
        /// to set maxHeight or maxWidth.
        /// Limited Box doesn't follow constraints when the parent is already
        /// Bounded by constraints. It doesn't follow maxHeight of width
        /// in that case
        LimitedBox(
          maxHeight: 200,
          child: Container(
            color: Colors.amber,
            child: Center(
              child: Text(
                "I am wrapped inside a Limited Box with maxHeight set to 200\n"
                    "This is necessary as my parent (ListView) is unconstrained",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
          ),
        ),
        ),
      ],
    );

Widget landscapeLayout(context) => Container(
      color: Colors.indigo,
      child: LimitedBox(
        maxWidth: 20,
        child: Container(
          color: Colors.amber,
          child: Center(
            child: Text(
              "I am wrapped inside a Limited Box with maxWidth set to 20\n"
              "But as my parent (Container) is already constrained, LimitedBox is respecting\n"
              "those constrains.",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
