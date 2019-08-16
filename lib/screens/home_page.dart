import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/bloc/list_bloc.dart';
import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:flutter_widget_guide/widgets/home_list_item.dart';

import '../profile_screen.dart';
import 'WebViewWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext _buildContext;
  var versionNumber;
  String appLink = "https://play.google.com/store/apps/details?id=com.annsh.flutterwidgetguide";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Utils.getVersion().then((value) {
      versionNumber = value;
    });
    setupRemoteConfig();
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return homePageScaffold(context);
  }

  Widget homePageScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Scaffold(
          key: _scaffoldKey,
          body: sliverWidgetList(),
        ),
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

  Widget appBar(BuildContext context) => SliverAppBar(
        backgroundColor: Colors.white,
        pinned: true,
        elevation: 3.0,
        forceElevated: false,
        expandedHeight: 80.0,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 14.0),
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12.0, left: 8.0),
                child: GestureDetector(
                  child: FlutterLogo(
                    colors: Colors.cyan,
                    textColor: Colors.white,
                  ),
                  onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewWidget(
                          url: "https://flutter.dev"),
                    ),
                  ),
                ),
              ),
              //To give a margin
              SizedBox(
                width: 0.0,
              ),
              Text(
                Utils.appName,
                style: TextStyle(
                    fontFamily: Utils.ubuntuRegularFont, fontSize: 16),
              ),
              SizedBox(
                width: 0.0,
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 8.0),
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundImage: AssetImage('assets/images/dp.png'),
                  ),
                ),
                onTap: () => showModalBottomSheet(
                    context: context, builder: (context) => ProfileScreen()),
              ),
            ],
          ),
        ),
//        actions: <Widget>[
//
//        ],
      );

  Widget bodyList(List<ListItem> listItems) => SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return listItemDesign(context, listItems[index], index);
        }, childCount: listItems.length),
      );

  /// Setup remote config and fetch value of key: current_version
  setupRemoteConfig() async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    // Enable developer mode to relax fetch throttling
    // TODO: remove in prod
    remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
    /// if network is weak and fetching fails, set default value
    remoteConfig.setDefaults(<String, dynamic>{
      'current_version': versionNumber,
    });
    await remoteConfig.fetch(expiration: const Duration(hours: 5));
    await remoteConfig.activateFetched();
    if (remoteConfig.getString("current_version") != versionNumber) {
      buildSnakbar();
    } else {
      //do nothing
    }
  }


  /// Build a snackbar to notify user that a new update is available
  buildSnakbar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Update Available"),
      duration: Duration(seconds: 10),
      backgroundColor: Colors.green,
      action: SnackBarAction(
        label: 'UPDATE',
        onPressed: () {
          Utils.launchURL(appLink);
        },
      ),
    ));
  }
}
