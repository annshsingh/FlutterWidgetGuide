import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  ///Page Controller for the PageView
  final controller = PageController(
    initialPage: 0,
  );
  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Page View Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(actionIcon),
              onPressed: () {
                setState(() {
                  scrollDirection == Axis.horizontal
                      ? scrollDirection = Axis.vertical
                      : scrollDirection = Axis.horizontal;
                  actionIcon == Icons.swap_vert
                      ? actionIcon = Icons.swap_horiz
                      : actionIcon = Icons.swap_vert;
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content:
                          Text("Scroll Direction changed to $scrollDirection"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                });
                controller.position.applyViewportDimension(
                    scrollDirection == Axis.vertical
                        ? _screenSize.height
                        : _screenSize.width);
              }),
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.pageViewCode),
              ),
            ),
          )
        ],
      ),

      ///A Page View with 3 children
      body: PageView(
        controller: controller,
        scrollDirection: scrollDirection,

        ///Enable physics property to provide your PageView with a
        ///custom scroll behaviour
        ///Here BouncingScrollPhysics will pull back the boundary
        ///item (first or last) if the user tries to scroll further.
        //physics: BouncingScrollPhysics(),
        pageSnapping: true,
        children: <Widget>[
          Container(
            color: Theme.of(context).canvasColor,
            child: Card(
              color: Colors.lightBlue,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "Card 1",
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: Card(
              color: Colors.purpleAccent,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "Card 2",
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: Card(
              color: Colors.pink,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  "Card 3",
                  style: TextStyle(
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
