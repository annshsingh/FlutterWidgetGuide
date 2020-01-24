import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class ValueListenableBuilderWidget extends StatefulWidget {
  @override
  _ValueListenableBuilderWidgetState createState() =>
      _ValueListenableBuilderWidgetState();
}

class _ValueListenableBuilderWidgetState
    extends State<ValueListenableBuilderWidget> {
  /// This is the value you want your widgets to listen to.
  final ValueNotifier<int> _counter = ValueNotifier<int>(2);

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
          'ValueListenableBuilder Widget',
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
                builder: (context) =>
                    CodeScreen(code: Code.valueListenableBuilderCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, int value, Widget child) {
            // This builder will only get called when the _counter
            // is updated.
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '$value',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 34.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The number is now ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: value.remainder(2) == 0
                        ? Text(
                            "Even",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0),
                          )
                        : Text(
                            "Odd",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0),
                          ),
                  ),
                ),
                child,
              ],
            );
          },
          valueListenable: _counter,
          // The child parameter is most helpful if the child is
          // expensive to build and does not depend on the value from
          // the notifier.
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("I dont care about the value"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
