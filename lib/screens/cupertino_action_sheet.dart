import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class CupertinoActionSheetWidget extends StatefulWidget {
  @override
  _CupertinoActionSheetWidgetState createState() =>
      _CupertinoActionSheetWidgetState();
}

class _CupertinoActionSheetWidgetState
    extends State<CupertinoActionSheetWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
          'CupertinoActionSheet Widget',
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
                    CodeScreen(code: Code.cupertinoActionSheetWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).backgroundColor,
          child: Text(
            "Show sheet",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () => {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: Text(
                  "Things",
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                ),
                message: Text(
                  "Small list of things to do",
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                ),
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).pop("Add"),
                    isDefaultAction: true,
                  ),
                  CupertinoActionSheetAction(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                    onPressed: () => Navigator.of(context).pop("Delete"),
                    isDestructiveAction: true,
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => Navigator.of(context).pop("Cancel"),
                  isDestructiveAction: true,
                ),
              ),

              ///Getting the chosen option value from sheet here
            ).then(
              (option) {
                if (option != null) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Chosen option is - $option"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              },
            ),
          },
        ),
      ),
    );
  }
}