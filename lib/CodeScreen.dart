import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_guide/utils.dart';

import 'syntax_highlighter.dart';

class CodeScreen extends StatefulWidget {
  final String code;

  CodeScreen({Key key, @required this.code}) : super(key: key);

  @override
  CodeScreenState createState() => CodeScreenState();
}

class CodeScreenState extends State<CodeScreen> {
  SyntaxHighlighterStyle _style = SyntaxHighlighterStyle.lightThemeStyle();
  var _actionIcon = Icons.brightness_low;
  var _isDarkThemeSet = false;
  var _bgColor = Colors.white;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: _bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Code',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: Utils.ubuntuRegularFont),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(_actionIcon),
                onPressed: () => setDarkTheme(_isDarkThemeSet ? false : true))
          ],
        ),
        /// Scrollbar widget to show scrollbar while scrolling
        body: Scrollbar(
          /// For horizontal scrolling
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 800.0,
              child: Scrollbar(
                /// For vertical scrolling
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: RichText(
                        text: DartSyntaxHighlighter(_style).format(widget.code),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Clipboard.setData(new ClipboardData(text: widget.code));
            _scaffoldKey.currentState.showSnackBar(
              new SnackBar(
                content: new Text("Copied to Clipboard"),
              ),
            );
          },
          label: Text("Copy"),
          icon: Icon(
            Icons.content_copy,
          ),
        ),
      ),
    );
  }

  setDarkTheme(bool set) {
    if (set) {
      setState(() {
        _actionIcon = Icons.brightness_high;
        _style = SyntaxHighlighterStyle.darkThemeStyle();
        _isDarkThemeSet = true;
        _bgColor = Colors.black;
      });
    } else {
      setState(() {
        _actionIcon = Icons.brightness_low;
        _style = SyntaxHighlighterStyle.lightThemeStyle();
        _isDarkThemeSet = false;
        _bgColor = Colors.white;
      });
    }
  }
}
