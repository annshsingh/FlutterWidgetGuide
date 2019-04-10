import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class TooltipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'Tooltip Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
      ),
      /// Tooltip uses your theme data to control its background color and
      /// the text color.
      /// Code from [Tooltip doc] :
      /// textTheme: theme.brightness == Brightness.dark ? theme.textTheme : theme.primaryTextTheme,
      /// background: theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Wrap(
              spacing: 20,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              runSpacing: 48,
              children: <Widget>[
                Tooltip(
                  message: "Default Tooltip",
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Long Press',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: Utils.ubuntuRegularFont),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Tooltip(
                  message: "Tooltip with an offset",
                  verticalOffset: 54,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        'Long Press',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: Utils.ubuntuRegularFont),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Tooltip(
                  message: "Tooltip with custom height",
                  height: 50,
                  verticalOffset: 54,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Long Press',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: Utils.ubuntuRegularFont),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: Icon(Icons.insert_emoticon),
                  tooltip: "Default Icon Tooltip",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
