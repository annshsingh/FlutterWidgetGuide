import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class SliverAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Scroll view for Sliver app bar for giving custom scroll behaviour
      body: CustomScrollView(
        slivers: <Widget>[
          ///First sliver is the App Bar
          SliverAppBar(
            ///Properties of app bar
            ///
            /// Color of app bar when it is collapsed
            backgroundColor: Theme.of(context).primaryColor,

            /// Set to false so that appbar is always invisible after
            /// collapsing
            /// If set to true here, the app bar will expand as soon as you
            /// start scrolling up even if you haven't reached the top
            floating: false,

            /// To make the app bar visible at all times after collapsing
            /// we set pinned to true
            pinned: true,
            expandedHeight: 200.0,

            ///Properties of the App Bar when it is expanded
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "SliverAppBar Widget",
                style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
              background: Container(
                color: Colors.lightBlue,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.code),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CodeScreen(code: Code.sliverAppBarCode),
                  ),
                ),
              )
            ],
          ),

          ///Next sliver is the Sliver list that is used here to
          ///allow the user to scroll and observe the collapsing
          ///behaviour of SliverAppBar widget
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              [
                listItem("List item 1", context),
                listItem("List item 2", context),
                listItem("List item 3", context),
                listItem("List item 4", context),
                listItem("List item 5", context),
                listItem("List item 6", context),
                listItem("List item 7", context),
                listItem("List item 8", context),
                listItem("List item 9", context),
                listItem("List item 10", context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(String title, BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 1.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: Utils.ubuntuRegularFont),
          ),
        ),
      );
}
