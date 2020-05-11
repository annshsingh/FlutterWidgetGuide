import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class NotificationListenerWidget extends StatefulWidget {
  @override
  _NotificationListenerWidgetState createState() => _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState extends State<NotificationListenerWidget> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NotificationListener Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.notificationListenerCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: NotificationListener<ColorNotification>(
          child: ChangeColor(
            bgColor: color,
          ),

          ///Notification is received here whenever
          onNotification: (notification) {
            setState(() {
              color = notification.color;
            });
            return true;
          },
        ),
      ),
    );
  }
}

///Child widget that will initiate a change to bubble up the parent
class ChangeColor extends StatelessWidget {
  final Color bgColor;

  ChangeColor({this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        color: bgColor,
        child: Text("Click to change my color"),
        onPressed: () {
          final randomColor = Utils.getRandomColor();
          ColorNotification(color: randomColor)..dispatch(context);
        },
      ),
    );
  }
}

class ColorNotification extends Notification {
  final Color color;

  const ColorNotification({this.color});
}
