import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Drawer Widget',
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
                builder: (context) => CodeScreen(code: Code.drawerWidgetCode),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(child: getDrawerContent(context)),
      endDrawer: Drawer(child: getDrawerContent(context)),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Open Drawer (from left)'),
                  color: Theme.of(context).backgroundColor,
                  textColor: Theme.of(context).accentColor,
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Open Drawer (from right)'),
                  color: Theme.of(context).backgroundColor,
                  textColor: Theme.of(context).accentColor,
                  onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getDrawerContent(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                "Drawer Header",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text("List item 1"),
        ),
        ListTile(
          title: Text("List item 2"),
        ),
        ListTile(
          title: Text("List item 3"),
        ),
        ListTile(
          title: Text("List item 4"),
        ),
        Center(
          child: FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.blue, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(50)),
            child: Text("Click to dismiss"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        )
      ],
    );
  }
}
