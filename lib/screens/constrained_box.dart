import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class ConstrainedBoxWidget extends StatefulWidget {
  @override
  _ConstrainedBoxWidgetState createState() => _ConstrainedBoxWidgetState();
}

class _ConstrainedBoxWidgetState extends State<ConstrainedBoxWidget> {

  @override
  void initState() {
    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ConstrainedBox Widget',
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
                builder: (context) => CodeScreen(code: Code.constrainedBoxCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: const Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'This card fill the parent because of BoxConstraints.expand()',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Utils.ubuntuRegularFont,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minHeight: 100, maxWidth: 100),
                          child: const Card(
                            color: Colors.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'This card has BoxConstraints(minHeight: 100, maxWidth: 100). So the text will not be'
                                ' clipped even if more characters are added..........',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: Utils.ubuntuRegularFont,
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxHeight: 100, maxWidth: 200),
                          child: const Card(
                            color: Colors.amber,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'This card has BoxConstraints(maxHeight: 100, maxWidth: 200). So the text will be'
                                ' clipped after a few characters..........',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: Utils.ubuntuRegularFont,
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightForFinite(
                              width: 200, height: double.infinity),
                          child: const Card(
                            color: Colors.orange,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'This card has BoxConstraints.tightForFinite(width: 100, height: double.infinity)'
                                ' So the text will keep flowing vertically even if more characters are added.',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: Utils.ubuntuRegularFont,
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
