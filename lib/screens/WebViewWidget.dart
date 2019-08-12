import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class WebViewWidget extends StatefulWidget {
  final url;

  WebViewWidget({Key key, @required this.url}) : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'WebView Widget',
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
                  builder: (context) => CodeScreen(code: Code.tooltipCode),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.open_in_browser),
              onPressed: () => Utils.launchURL(widget.url),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.url),
            ),
          ],
        ));
  }
}
