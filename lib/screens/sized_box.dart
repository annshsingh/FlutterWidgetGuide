import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class SizedBoxWidget extends StatefulWidget {
  @override
  _SizedBoxWidgetState createState() => _SizedBoxWidgetState();
}

class _SizedBoxWidgetState extends State<SizedBoxWidget> {
  ///Using a list to control both the dimensions at once
  List<double> _dimentions = [100.0, 100.0];
  List<double> _dimentions1 = [200.0, 200.0];
  List<double> _dimentions2 = [300.0, 100.0];
  List<double> _dimentions3 = [200.0, double.infinity];
  List<double> _dimentions4 = [300.0, 300.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SizedBox Widget',
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
                builder: (context) => CodeScreen(code: Code.sizedCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(18),
              child: Center(
                child: SizedBox(
                  width: _dimentions[1],
                  height: _dimentions[0],
                  child: RaisedButton(
                    child: Text(
                      'Change my size',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("Pressed");
                    },
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            divider(context),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              child: Wrap(
                children: <Widget>[
                  _OptionItem(_dimentions1, _dimentions, _onDimentionsChanged,
                      'h: 200 | w: 200'),
                  _OptionItem(_dimentions2, _dimentions, _onDimentionsChanged,
                      'h: 300 | w: 100'),
                  _OptionItem(_dimentions3, _dimentions, _onDimentionsChanged,
                      'h: 200 | w: double.infinity'),
                  _OptionItem(_dimentions4, _dimentions, _onDimentionsChanged,
                      'h: 300 | w: 300'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _onDimentionsChanged(List<double> list) => setState(() {
        _dimentions = list;
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
