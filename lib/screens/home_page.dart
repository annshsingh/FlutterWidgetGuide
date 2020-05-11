import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_guide/bloc/list_bloc.dart';
import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:flutter_widget_guide/widgets/home_list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Ads.dart';
import '../profile_screen.dart';
import 'WebViewWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// WidgetsBindingObserver helps to keep track of the app lifecycle state
class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  BuildContext _buildContext;
  var versionNumber;
  bool isFabVisible = true;
  bool hasJoinedSlack = false;
  ScrollController _hideButtonController;
  bool isCheckBoxChecked = false;
  String appLink =
      "https://play.google.com/store/apps/details?id=com.annsh.flutterwidgetguide";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseMessaging _fcm;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //print("The state is $state");
    /// do something here to release FCM instance so that it doesn't configure
    /// again when user comes back to the app from Recent Apps
    /// Nothing can be done as of now.
    /// Link to the issue:
    /// https://github.com/FirebaseExtended/flutterfire/issues/1060
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    //Dispose the Ad if it isn't already
    Ads.hideBannerAd();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //Initialize Firebase Admob
    Ads.initialize();
    _fcm = FirebaseMessaging();
    Utils.getVersion().then((value) {
      versionNumber = value;
    });
    setupRemoteConfig();
    _getValueFromSP();
    isFabVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(
      () {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (isFabVisible == true) {
            setState(() => isFabVisible = false);
          }
        } else {
          if (_hideButtonController.position.userScrollDirection ==
              ScrollDirection.forward) {
            if (isFabVisible == false) {
              setState(() => isFabVisible = true);
            }
          }
        }
      },
    );

    /// To check if the user is already subscribed to the topic
    _getIsSubscribed().then((isSubscribed) {
      if (!isSubscribed) {
        _fcm.subscribeToTopic("learn").then((value) {
          _setIsSubscribed(true);
        }, onError: (e) {
          _setIsSubscribed(false);
        });
      }
    });

    //_getIsFcmConfigured().then((value) {
    // if (!value) {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        /// Called whenever the app is in foreground and receives a notification
        /// A dialog box is shown to the user in this case
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text("A new message from the developer!"),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Click open to visit the link"),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Open'),
                onPressed: () => {
                  Navigator.of(context).pop(),
                  _takeNotificationAction(message, context, true),
                },
              ),
            ],
          ),
        );
      },
      onBackgroundMessage: backgroundHandle,
      onLaunch: (Map<String, dynamic> message) async {
        /// Called whenever the app is killed and receives a notification
        _takeNotificationAction(message, context, false);
      },
      onResume: (Map<String, dynamic> message) async {
        /// Called whenever the app is running in background
        /// and receives a notification
        _takeNotificationAction(message, context, false);
      },
    );
    // }
    //});
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
        child: WillPopScope(
          child: Scaffold(
            key: _scaffoldKey,
            body: sliverWidgetList(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Visibility(
              visible: isFabVisible && !hasJoinedSlack,
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFFffffff),
                icon: Container(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    Utils.slack_img,
                    semanticsLabel: "Join Slack",
                  ),
                ),
                label: Text(
                  "Join us",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: Utils.ubuntuRegularFont),
                ),
                onPressed: () => {
                  showDialog(
                    context: context,

                    /// StatefulBuilder is used here to make setState work on AlertDialog
                    /// For checkbox state functionality
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              "Join us at\nFlutter Worldwide",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Utils.ubuntuRegularFont),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "My main motive here is to create a community of flutter developers"
                                " from all around the world. Join us to expand your knowledge on Flutter"
                                " with the rest of the world.",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: Utils.ubuntuRegularFont,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlineButton(
                                    child: Text("Get an Invite"),
                                    onPressed: () => Utils.launchURL(
                                        "${Utils.slack_invite}"),
                                    borderSide: BorderSide(color: Colors.blue),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Already joined? \nCheck to hide FAB"),
                                    Checkbox(
                                      value: isCheckBoxChecked,
                                      activeColor: Colors.blue,
                                      onChanged: (bool isChecked) {
                                        setState(
                                          () {
                                            isCheckBoxChecked = isChecked;
                                          },
                                        );
                                        _hideFabForever(isChecked);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                },
              ),
            ),
          ),
          onWillPop: _willPopCallback,
        ),
      );

  Widget sliverWidgetList() {
    ListBloc listBloc = ListBloc();
    return StreamBuilder<List<ListItem>>(
        stream: listBloc.listItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  controller: _hideButtonController,
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
        backgroundColor: Theme.of(context).primaryColorDark,
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WebViewWidget(url: "https://flutter.dev"),
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
    // TODO: remove in prod / Enable in debug mode for faster testing
    //remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
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

  /// Method to call when user checks checkbox
  _hideFabForever(bool isChecked) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hidefab', isChecked);
    setState(() {
      hasJoinedSlack = isChecked;
    });
  }

  /// Method to get value from shared preferences
  _getValueFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('hidefab') != null) {
        hasJoinedSlack = prefs.getBool('hidefab');
      } else {
        hasJoinedSlack = false;
      }
    });
  }

  _setIsSubscribed(bool isSubscribed) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("subscribed", isSubscribed);
  }

  Future<bool> _getIsSubscribed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("subscribed") == null ||
        prefs.getBool("subscribed") == false) {
      return false;
    } else {
      return true;
    }
  }
}

/// Use this method to define some kind of a background task
/// We are not using it, only here for learning purpose
Future<dynamic> backgroundHandle(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
  }

  if (message.containsKey('notification')) {
    // Handle notification message
  }

  // Or do other work.
}

/// Method to be called whenever the app receives a notification
_takeNotificationAction(
    Map<String, dynamic> message, BuildContext context, bool isInside) {
  /// If the notification was opened when app was in background/closed
  if (!isInside) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            return Container(
              height: 100,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue)),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text("Loading..."),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    /// To display alert dialog for 3 seconds and take necessary action
    /// after that
    Future.delayed(
      Duration(seconds: 3),
      () {
        //remove the loading dialog box
        Navigator.of(context, rootNavigator: true).pop();
        if (message['data']['type'] == 'update') {
          Utils.launchURL(message['data']['url']);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewWidget(url: message['data']['url']),
            ),
          );
        }
      },
    );
  } else {
    /// If the notification was opened from inside the app
    if (message['data']['type'] == 'update') {
      Utils.launchURL(message['data']['url']);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewWidget(url: message['data']['url']),
        ),
      );
    }
  }
  //_setIsFcmConfigured(true);
}

Future<bool> _willPopCallback() async {
  /// do something here to release FCM instance so that it doesn't configure
  /// again when user comes back to the app from Recent Apps
  /// Nothing can be done as of now.
  /// Link to the issue:
  /// https://github.com/FirebaseExtended/flutterfire/issues/1060
  return true; // return true if the route to be popped
}

//_setIsFcmConfigured(bool isConfigured) async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  prefs.setBool("isConfigured", isConfigured);
//}
//
//Future<bool> _getIsFcmConfigured() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  if (prefs.getBool("isConfigured") == null ||
//      prefs.getBool("isConfigured") == false) {
//    return false;
//  } else {
//    return true;
//  }
//}
