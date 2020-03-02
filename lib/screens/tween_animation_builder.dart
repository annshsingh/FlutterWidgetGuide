import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class TweenAnimationBuilderWidget extends StatefulWidget {
  @override
  _TweenAnimationBuilderWidgetState createState() =>
      _TweenAnimationBuilderWidgetState();
}

class _TweenAnimationBuilderWidgetState
    extends State<TweenAnimationBuilderWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TweenAnimationBuilder Widget',
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
                builder: (context) => CodeScreen(code: Code.tweenAnimationBuilderWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: TweenAnimationBuilder<Color>(
          duration: const Duration(seconds: 3),

          ///Values for the Animation
          ///Type of tween (here: Color) should match the second parameter
          ///of the builder and the Class type parameter(if specified)
          tween: ColorTween(begin: Colors.yellow, end: Colors.purple),

          /// Added child here as a performance optimization. Just so that
          /// flutter does not build the entire widget tree during the animation
          child: FlutterLogo(
            size: 200,
            colors: Colors.yellow,
          ),
          builder: (BuildContext _, Color value, Widget child) {
            return ColorFiltered(
              child: child,
              colorFilter: ColorFilter.mode(value, BlendMode.modulate),
            );
          },
          onEnd: () => _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Done with the Animation"),
              duration: Duration(milliseconds: 3000),
            ),
          ),
        ),
      ),
    );
  }
}
