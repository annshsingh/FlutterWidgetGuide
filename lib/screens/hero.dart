import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class HeroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hero Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.heroCode),
              ),
            ),
          )
        ],
      ),
      body: WillPopScope(
        child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                  child: Text(
                    'Click the Widget below to observe Hero animation in slow motion',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: Utils.ubuntuRegularFont),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Hero(
                      tag: "hero",
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(12),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              child: Container(
                                color: Colors.amber,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              clipBehavior: Clip.antiAlias,
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: 100,
                                height: 100,
                                child: FlutterLogo(
                                  colors: Colors.lightBlue,
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '${Utils.hero2}');
              timeDilation = 4.0;
            }),
        onWillPop: () {
          ///Reset timeDilation since it is a Global property
          timeDilation = 1.0;
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
