import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class ColorFilteredWidget extends StatefulWidget {
  @override
  _ColorFilteredWidgetState createState() => _ColorFilteredWidgetState();
}

class _ColorFilteredWidgetState extends State<ColorFilteredWidget> {
  var _blendmode = BlendMode.darken;
  var _blendmode1 = BlendMode.softLight;
  var _blendmode2 = BlendMode.colorBurn;
  var _blendmode3 = BlendMode.difference;
  var _blendmode4 = BlendMode.multiply;

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
          'ColorFiltered Widget',
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
                    CodeScreen(code: Code.colorFilteredWidgetCode),
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
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.blue, _blendmode),
                  child: Image.asset('assets/images/dp.png'),
                ),
              ),
            ),
            divider(context),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              child: Wrap(
                children: <Widget>[
                  _OptionItem(_blendmode1, _blendmode, _onBlendModeChanged,
                      'BlendMode.softLight'),
                  _OptionItem(_blendmode2, _blendmode, _onBlendModeChanged,
                      'BlendMode.colorBurn'),
                  _OptionItem(_blendmode3, _blendmode, _onBlendModeChanged,
                      'BlendMode.difference'),
                  _OptionItem(_blendmode4, _blendmode, _onBlendModeChanged,
                      'BlendMode.multiply'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _onBlendModeChanged(BlendMode blendMode) => setState(() {
        _blendmode = blendMode;
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
