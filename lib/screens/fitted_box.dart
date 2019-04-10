import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

class FittedBoxWidget extends StatefulWidget {
  @override
  _FittedBoxWidgetState createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  var _boxFit = BoxFit.contain;

  var _heightValue = 400.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Text(
              'FittedBox Widget',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
          margin: EdgeInsets.only(right: 48),
        ),
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange,
                child: FittedBox(
                  fit: _boxFit,
                  child: Container(
                    color: Colors.yellow,
                    height: _heightValue,
                    width: 300,
                    child: FlutterLogo(
                      colors: Colors.lightBlue,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(18),
                child: Wrap(
                  children: <Widget>[
                    _OptionItem(
                        BoxFit.contain, _boxFit, _onFitChanged, 'Fit: Contain'),
                    _OptionItem(
                        BoxFit.fill, _boxFit, _onFitChanged, 'Fit: Fill'),
                    _OptionItem(
                        BoxFit.cover, _boxFit, _onFitChanged, 'Fit: Cover'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Text(
                  'Slide the slider widget to change the value of height\n'
                      'to observe how the widget adjusts itself',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: Utils.ubuntuRegularFont),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Slider(
                  value: _heightValue,
                  activeColor: Colors.lightBlue,
                  inactiveColor: Colors.lightBlue[50],
                  min: 200.0,
                  max: 800.0,
                  divisions: 100,
                  label: '${_heightValue.round()}',
                  onChanged: (double value) {
                    setState(() {
                      _heightValue = value;
                    });
                  },
                ),
              ),
              Container(
                child: const Text(
                    'Drag to change height of inner widget (yellow)'),
                margin: EdgeInsets.only(bottom: 24),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  _onFitChanged(BoxFit value) => setState(() {
        _boxFit = value;
      });
}

///Radio button option item
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
