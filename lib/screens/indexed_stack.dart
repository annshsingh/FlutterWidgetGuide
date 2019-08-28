import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class IndexedStackWidget extends StatefulWidget {
  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int count = 0;
  int _widgetIndex = 0;
  Color _imageColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'IndexedStack Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                /// 3 widgets stacked (Index 0, 1 & 2)
                /// State will be preserved while switching
                IndexedStack(
                  index: _widgetIndex,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 250,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$count",
                            style:
                                TextStyle(color: Colors.white, fontSize: 48.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: RaisedButton(
                              onPressed: () =>
                                  setState(() => count = count = count + 1),
                              color: Colors.black,
                              textColor: Colors.white,
                              child: Text("Press me"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      color: Colors.white,
                      child: GestureDetector(
                        child: FlutterLogo(
                          duration: Duration(milliseconds: 500),
                          colors: _imageColor,
                          curve: Curves.easeInOut,
                        ),
                        onTap: () => setState(() => _imageColor == Colors.blue
                            ? _imageColor = Colors.amber
                            : _imageColor = Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () =>
                    _widgetIndex == 0 ? null : setState(() => _widgetIndex = 0),
                color: _widgetIndex == 0 ? Colors.grey : Colors.blue,
                textColor: Colors.white,
                child: Text("Index 0"),
              ),
              RaisedButton(
                onPressed: () =>
                    _widgetIndex == 1 ? null : setState(() => _widgetIndex = 1),
                color: _widgetIndex == 1 ? Colors.grey : Colors.blue,
                textColor: Colors.white,
                child: Text("Index 1"),
              ),
              RaisedButton(
                onPressed: () =>
                    _widgetIndex == 2 ? null : setState(() => _widgetIndex = 2),
                color: _widgetIndex == 2 ? Colors.grey : Colors.blue,
                textColor: Colors.white,
                child: Text("Index 2"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
