import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class StackWidget extends StatefulWidget {
  @override
  _StackWidgetState createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  AlignmentDirectional _alignment = AlignmentDirectional.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stack Widget',
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
                builder: (context) => CodeScreen(code: Code.stackCode),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(18.0),
            child: Center(
              child: Stack(
                overflow: Overflow.clip,
                alignment: _alignment,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.green,
                  ),
                  Container(
                    width: 85,
                    height: 85,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 24),
              child: Text(
                'Select Alignment',
                style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
            ),
          ),

          ///Container containing all the Radio buttons
          Container(
            margin: EdgeInsets.all(18),
            child: Wrap(
              children: <Widget>[
                _OptionItem(AlignmentDirectional.topStart, _alignment,
                    _onAlignmentChange, 'Top Start'),
                _OptionItem(AlignmentDirectional.bottomEnd, _alignment,
                    _onAlignmentChange, 'Bottom End'),
                _OptionItem(AlignmentDirectional.center, _alignment,
                    _onAlignmentChange, 'Center'),
                _OptionItem(AlignmentDirectional.topCenter, _alignment,
                    _onAlignmentChange, 'Top Center'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///method called whenever you want to change alignment of stacked elements
  _onAlignmentChange(AlignmentDirectional value) => setState(() {
        _alignment = value;
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
