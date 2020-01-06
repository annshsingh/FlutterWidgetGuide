import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var versionNumber;
  String appLink =
      "https://play.google.com/store/apps/details?id=com.annsh.flutterwidgetguide";

  @override
  void initState() {
    super.initState();
    Utils.getVersion().then((value) {
      versionNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Text(
                    "Social Links",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Utils.ubuntuRegularFont,
                        color: Theme.of(context).backgroundColor),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Wrap(
                  spacing: 0.0,
                  // gap between adjacent chips
                  runSpacing: 10.0,
                  // ga
                  runAlignment: WrapAlignment.center,
                  // p be
                  alignment: WrapAlignment.center,

                  /// tween lines
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: socialMediaLinks(
                          "Github",
                          'assets/images/github.png',
                          "https://github.com/annshsingh"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: socialMediaLinks(
                          "LinkedIn",
                          'assets/images/linkedin.png',
                          "https://www.linkedin.com/in/annsh/"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: socialMediaLinks(
                          "Twitter",
                          'assets/images/twitter.png',
                          "https://twitter.com/annsh2013"),
                    ),
                    RaisedButton(
                      textColor: Colors.black87,
                      color: Colors.blue[500],
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                              )),
                          Text(
                            "Rate the app",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: Utils.ubuntuRegularFont,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => Utils.launchURL(appLink),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Version: $versionNumber",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: Utils.ubuntuRegularFont,
                      color: Theme.of(context).backgroundColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Made with",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: Utils.ubuntuRegularFont,
                            color: Theme.of(context).backgroundColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                      Text(
                        "in India",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: Utils.ubuntuRegularFont,
                            color: Theme.of(context).backgroundColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header() => Ink(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage("assets/images/dp.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        'Annsh Singh',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).backgroundColor,
                            fontFamily: Utils.ubuntuRegularFont),
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: Utils.ubuntuRegularFont,
                      ),
                    ),
                  ],
                ),
                onPressed: () => Utils.launchURL(
                    "mailto:annsh29@gmail.com?subject=Contact query from: Flutter Widget Guide&body=Hi Annsh, \n"),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
      );

  Widget socialMediaLinks(String label, String imagePath, String url) =>
      RaisedButton(
        textColor: Colors.black87,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 14.0,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: Utils.ubuntuRegularFont,
              ),
            ),
          ],
        ),
        onPressed: () => Utils.launchURL(url),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      );
}
