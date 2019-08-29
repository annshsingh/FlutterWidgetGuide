import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class SemanticsWidget extends StatefulWidget {
  @override
  _SemanticsWidgetState createState() => _SemanticsWidgetState();
}

class _SemanticsWidgetState extends State<SemanticsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Semantics Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.amber,
                ),
                Semantics(
                  child: FlutterLogo(
                    size: 250,
                  ),
                  label: "Flutter Logo",
                  enabled: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "If you enable Talkback feature from your devices Accessibility settings"
              "and click on the Flutter Logo, the device will announce whatever you have"
              "written on the label tag in Semantics widget",
              style:
                  TextStyle(fontFamily: Utils.ubuntuRegularFont, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
