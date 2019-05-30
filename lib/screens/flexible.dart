import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class FlexibleWidget extends StatefulWidget {
  @override
  _FlexibleWidgetState createState() => _FlexibleWidgetState();
}

class _FlexibleWidgetState extends State<FlexibleWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'FittedBox Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.blue,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          pageOne(),
          pageTwo(),
          pageThree(),
        ],
      ),
    );
  }

  Widget pageOne() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.brown,
                width: double.maxFinite,
                child: Center(
                  child: Text('One'),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.teal,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageTwo() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                color: Colors.blue,
                width: double.maxFinite,
                child: Center(
                  child: Text('Two'),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.teal,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.indigo,
                width: double.maxFinite,
                child: Center(
                  child: Text('Three'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageThree() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.redAccent,
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.teal,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
