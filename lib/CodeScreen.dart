import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_guide/settings.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    _getValueFromSP(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {
              setDarkTheme(_isDarkThemeSet ? false : true, context);
              if (_isDarkThemeSet) {
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text("System wide Dark Theme applied"),
                    duration: Duration(milliseconds: 3000),
                  ),
                );
              } else {
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text("System wide Light Theme applied"),
                    duration: Duration(milliseconds: 3000),
                  ),
                );
              }
            },
          ),
        ],
      ),

      /// Scrollbar widget to show scrollbar while scrolling
      body: SafeArea(
        child: Scrollbar(
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
                      child: SelectableText.rich(
                        DartSyntaxHighlighter(_style).format(widget.code),
                        showCursor: false,
                        cursorColor: Colors.blue,
                        cursorRadius: Radius.circular(5),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          Clipboard.setData(new ClipboardData(text: widget.code));
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: new Text("Copied to Clipboard"),
            ),
          );
        },
        label: Text(
          "Copy",
          style: TextStyle(color: Colors.black87),
        ),
        icon: Icon(
          Icons.content_copy,
          color: Colors.black87,
        ),
      ),
    );
  }

  setDarkTheme(bool set, BuildContext context) {
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

    Provider.of<Settings>(context, listen: false).setDarkMode(set);
  }

  /// Method to get value from shared preferences
  _getValueFromSP(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('isDarkMode') != null) {
        _isDarkThemeSet = prefs.getBool('isDarkMode');
        setDarkTheme(_isDarkThemeSet, context);
      } else {
        _isDarkThemeSet = false;
        setDarkTheme(_isDarkThemeSet, context);
      }
    });
  }
}
