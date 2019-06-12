import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var versionNumber;

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
      color: Colors.white,
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
                  color: Colors.black12,
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
                        color: Colors.black45),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 1,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    socialMediaLinks("Github", 'assets/images/github.png',
                        "https://github.com/annshsingh"),
                    Container(
                      height: 24,
                      width: 2,
                      color: Colors.black12,
                    ),
                    socialMediaLinks("LinkedIn", 'assets/images/linkedin.png',
                        "https://www.linkedin.com/in/annsh/"),
                    Container(
                      height: 24,
                      width: 2,
                      color: Colors.black12,
                    ),
                    socialMediaLinks("Twitter", 'assets/images/twitter.png',
                        "https://twitter.com/annsh2013"),
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
                      color: Colors.black45),
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
                            color: Colors.black45),
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
                            color: Colors.black45),
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
                            color: Colors.black87,
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
                fontSize: 14.0,
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
