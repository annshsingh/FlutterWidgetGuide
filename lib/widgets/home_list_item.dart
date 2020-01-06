import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../VideoView.dart';

/*
 * Defining a widget for list item
 */

String appLink =
    "https://play.google.com/store/apps/details?id=com.annsh.flutterwidgetguide";

Widget listItemDesign(BuildContext context, ListItem item, int index) => Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: item.title == "Rate the App"
          ? Colors.blue
          : Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () => item.title == "Rate the App"
            ? Utils.launchURL(appLink)
            : Navigator.pushNamed(context, '/${item.title}'),
        splashColor: Colors.cyan[100],
        highlightColor: Colors.transparent,
        child: ListTile(
          title: item.title == "Rate the App"
              ? Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${item.title}',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.insert_emoticon, color: Colors.white),
                      )
                    ],
                  ),
                )
              : item.description.isNotEmpty
                  ? Text(
                      '${index + 1}. ${item.title}',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 16.0),
                    )
                  : RichText(
                      text: TextSpan(
                        /// A default style for all the TextSpans below.
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Theme.of(context).backgroundColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "${index + 1}. ${item.title} "),
                          TextSpan(
                            text: "(coming soon)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
          trailing: item.title == "Rate the App"
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Icon(
                          Icons.live_tv,
                          size: 24,
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoView(
                              videoUrl: "${item.videoUrl}",
                              title: "${item.title}"),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Center(
                            child: Text(
                              "${item.title} Widget",
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
                                "${item.description}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: Utils.ubuntuRegularFont,
                                    fontWeight: FontWeight.w300),
                              ),
                              FlatButton(
                                onPressed: () => {
                                  Utils.launchURL(item.url),
                                  Navigator.pop(context)
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                // makes highlight invisible too
                                child: Text('(Official Documentation)',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Utils.crimsonRegularFont,
                                        color: Colors.cyan)),
                              ),
                              item.mediumUrl.length != 0
                                  ? Container(
                                      width: 203.0,
                                      child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .backgroundColor),
                                        highlightedBorderColor: Colors.black12,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        onPressed: () => {
                                          Utils.launchURL(item.mediumUrl),
                                          Navigator.pop(context)
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Center(
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                    Utils.medium_img,
                                                    semanticsLabel:
                                                        "Medium Icon",
                                                    color: Theme.of(context)
                                                        .backgroundColor,
                                                  ),
                                                ),
                                                width: 48.0,
                                                height: 48.0,
                                              ),
                                              Text('My Medium Post',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: Utils
                                                          .crimsonRegularFont,
                                                      color: Theme.of(context)
                                                          .backgroundColor)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
