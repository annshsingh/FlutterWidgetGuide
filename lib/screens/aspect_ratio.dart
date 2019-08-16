import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class AspectRatioWidget extends StatefulWidget {
  @override
  _AspectRatioWidgetState createState() => _AspectRatioWidgetState();
}

class _AspectRatioWidgetState extends State<AspectRatioWidget> {
  double aspectRatio = 1 / 1;
  double aspectRatio1 = 16 / 9;
  double aspectRatio2 = 3 / 2;

  @override
  void initState() {
    super.initState();
    /// Fix portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'AspectRatio Widget',
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
                  builder: (context) => CodeScreen(code: Code.aspectRatioCode),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              /// Aspect Ratio widget sizes itself freely
              /// depending on available space
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            divider(context),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              child: Wrap(
                children: <Widget>[
                  _OptionItem(
                      aspectRatio1, aspectRatio, _onRatioChanged, 'Ratio: 16/9'),
                  _OptionItem(aspectRatio2, aspectRatio, _onRatioChanged,
                      'Ratio: 3/2'),
                ],
              ),
            )
          ],
        ));
  }

  _onRatioChanged(double ratio) => setState(() {
        aspectRatio = ratio;
      });
}

class _OptionItem<T> extends StatelessWidget {
  const _OptionItem(this.value, this.groupValue, this.onChanged, this.title);

  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<T>(
            value: value,
            groupValue: groupValue,
            activeColor: Colors.lightBlue,
            onChanged: onChanged),
        GestureDetector(
          onTap: () {
            onChanged(value);
          },
          child: Text(
            title,
            style:
                TextStyle(fontSize: 14.0, fontFamily: Utils.ubuntuRegularFont),
          ),
        ),
      ],
    );
  }
}

Container divider(BuildContext context) => Container(
      child: Divider(),
      margin: EdgeInsets.only(left: 10, right: 10, top: 14),
    );
