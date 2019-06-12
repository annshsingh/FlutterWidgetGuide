import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/bloc/list_bloc.dart';
import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:flutter_widget_guide/widgets/home_list_item.dart';

import '../profile_screen.dart';

class HomePage extends StatelessWidget {
  BuildContext _buildContext;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return homePageScaffold(context);
  }

  Widget homePageScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Scaffold(key: _scaffoldKey, body: sliverWidgetList()),
      );

  Widget sliverWidgetList() {
    ListBloc listBloc = ListBloc();
    return StreamBuilder<List<ListItem>>(
        stream: listBloc.listItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  //This is to contain Sliver Elements
                  slivers: <Widget>[
                    appBar(context),
                    SliverPadding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    SliverPadding(
                      sliver: bodyList(snapshot.data),
                      padding: EdgeInsets.only(bottom: 12.0),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  /*
   * Setting up appbar -> Sliver App bar
   * This is to give the effect of Collapsing App Bar (android)
   */

  Widget appBar(BuildContext context) => SliverAppBar(
        backgroundColor: Colors.white,
        pinned: true,
        elevation: 3.0,
        forceElevated: false,
        expandedHeight: 80.0,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 16.0),
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlutterLogo(
                colors: Colors.cyan,
                textColor: Colors.white,
              ),
              //To give a margin
              SizedBox(
                width: 5.0,
              ),
              Text(
                Utils.appName,
                style: TextStyle(
                    fontFamily: Utils.ubuntuRegularFont, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/dp.png'),
              ),
            ),
            onTap: () => showModalBottomSheet(
                context: context, builder: (context) => ProfileScreen()),
          ),
        ],
      );

  /*
   * Defining a List -> Sliver List for Sliver App Bar
   */

  Widget bodyList(List<ListItem> listItems) => SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return listItemDesign(context, listItems[index]);
        }, childCount: listItems.length),
      );
}
