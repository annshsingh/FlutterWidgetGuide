import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

class ExpandedWidget extends StatefulWidget {
  @override
  _ExpandedWidgetState createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  ///Flex factor for 1st widget
  int _flexFactor0 = 1;
  ///Flex factor for 2nd widget
  int _flexFactor1 = 2;
  ///Flex factor for 3rd widget
  int _flexFactor2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Expanded Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Color(0xFF323232),
            ),
            onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        titlePadding: EdgeInsets.only(top: 28),
                        title: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Utils.ubuntuRegularFont),
                              ),
                              FlatButton(
                                onPressed: () =>
                                    Utils.launchURL(Utils.expandedSourceURL),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                // makes highlight invisible too
                                child: Text('(Source Code)',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Utils.crimsonRegularFont,
                                        color: Colors.cyan)),
                              ),
                            ],
                          ),
                        ),
                        content: Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.all(0),
                          child: SvgPicture.asset(
                            Utils.expanded_img,
                            semanticsLabel: "Expanded Description",
                          ),
                        ),
                      ),
                ),
          ),
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.expandedCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFe0e0e0),
              child: Row(
                children: <Widget>[
                  ///First flexible widget
                  Expanded(
                    flex: _flexFactor0,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: GestureDetector(
                        child: Container(
                          child: Center(
                            child: Text(
                              '$_flexFactor0',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF2196f3),
                          width: 48.0,
                          height: 48.0,
                        ),
                        onTap: () => setState(() {
                              _flexFactor0++;
                            }),
                      ),
                    ),
                  ),
                  ///Second flexible widget
                  Expanded(
                    flex: _flexFactor1,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: GestureDetector(
                        child: Container(
                          child: Center(
                            child: Text(
                              '$_flexFactor1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF673ab7),
                          width: 48.0,
                          height: 48.0,
                        ),
                        onTap: () => setState(() {
                              _flexFactor1++;
                            }),
                      ),
                    ),
                  ),
                  ///Third flexible widget
                  Expanded(
                    flex: _flexFactor2,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: GestureDetector(
                        child: Container(
                          child: Center(
                            child: Text(
                              '$_flexFactor2',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF009688),
                          width: 48.0,
                          height: 48.0,
                        ),
                        onTap: () => setState(() {
                              _flexFactor2++;
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///Click on this button to RESET the values of flex values
            Container(
              margin: EdgeInsets.all(16.0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () => setState(() {
                      _flexFactor0 = 1;
                      _flexFactor1 = 2;
                      _flexFactor2 = 1;
                    }),
                child: Text('RESET'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
