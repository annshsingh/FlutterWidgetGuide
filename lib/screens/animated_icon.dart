import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedIconWidget extends StatefulWidget {
  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  AnimationController _controller1;
  String speedFabText = "Slowly";

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    //Hide banner ad if it isn't already hidden
    Ads.hideBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AnimatedIcon Widget',
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
                builder: (context) => CodeScreen(code: Code.animatedIconCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// First row
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: animatedIconRow(_controller1, AnimatedIcons.add_event,
                  AnimatedIcons.arrow_menu, AnimatedIcons.close_menu),
            ),

            /// Second row
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: animatedIconRow(
                  _controller1,
                  AnimatedIcons.ellipsis_search,
                  AnimatedIcons.event_add,
                  AnimatedIcons.home_menu),
            ),

            /// Third row
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: animatedIconRow(_controller1, AnimatedIcons.list_view,
                  AnimatedIcons.menu_arrow, AnimatedIcons.menu_close),
            ),

            /// Fourth row
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: animatedIconRow(_controller1, AnimatedIcons.menu_home,
                  AnimatedIcons.pause_play, AnimatedIcons.play_pause),
            ),

            /// Fifth row
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AnimatedIcon(
                    size: 34.0,
                    icon: AnimatedIcons.search_ellipsis,
                    progress: _controller1,
                  ),
                  AnimatedIcon(
                    size: 34.0,
                    icon: AnimatedIcons.view_list,
                    progress: _controller1,
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),

                    /// Fab to control animation direction
                    child: FloatingActionButton.extended(
                      heroTag: "direction",
                      backgroundColor: Colors.green,
                      onPressed: () => setState(() {
                        _controller1.forward();
                        _controller1.status == AnimationStatus.completed
                            ? _controller1.reverse()
                            : _controller1.forward();
                      }),
                      icon: Icon(
                        Icons.movie_filter,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Animate",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),

                    /// Fab to control animation speed
                    child: FloatingActionButton.extended(
                      heroTag: "speed",
                      backgroundColor: Colors.white,
                      onPressed: () => setState(() {
                        _controller1.duration.inSeconds == 2
                            ? _controller1.duration =
                                const Duration(seconds: 10)
                            : _controller1.duration =
                                const Duration(seconds: 2);

                        _controller1.duration.inSeconds == 2
                            ? speedFabText = "Slowly"
                            : speedFabText = "Normal";
                      }),
                      icon: Icon(
                        Icons.slow_motion_video,
                        color: Colors.black,
                      ),
                      label: Text(
                        speedFabText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }
}

Widget animatedIconRow(AnimationController controller, AnimatedIconData icon1,
        AnimatedIconData icon2, AnimatedIconData icon3) =>
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AnimatedIcon(
          size: 34.0,
          icon: icon1,
          progress: controller,
        ),
        AnimatedIcon(
          size: 34.0,
          icon: icon2,
          progress: controller,
        ),
        AnimatedIcon(
          size: 34.0,
          icon: icon3,
          progress: controller,
        ),
      ],
    );
