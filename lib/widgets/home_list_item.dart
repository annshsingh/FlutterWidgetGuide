import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/utils.dart';

/*
 * Defining a widget for list item
 */

Widget listItemDesign(BuildContext context, ListItem item) => Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/${item.title}'),
        splashColor: Colors.cyan[100],
        highlightColor: Colors.transparent,
        child: ListTile(
          title: Text(
            '${item.title}',
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          trailing: IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Center(
                          child: Text(
                            "${item.title} Widget",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: Utils.ubuntuRegularFont),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "${item.description}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: Utils.ubuntuRegularFont,
                                  fontWeight: FontWeight.w300),
                            ),
                            FlatButton(
                              onPressed: () => Utils.launchURL(item.url),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              // makes highlight invisible too
                              child: Text('(Read More)',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Utils.crimsonRegularFont,
                                      color: Colors.cyan)),
                            ),
                          ],
                        ),
                      ),
                ),
          ),
        ),
      ),
    );
