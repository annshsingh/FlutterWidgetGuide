import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:youtube_player/youtube_player.dart';

class VideoView extends StatefulWidget {
  final String videoUrl;
  final String title;

  VideoView({Key key, @required this.videoUrl, @required this.title}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          '${widget.title} Widget Video',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x000000).withOpacity(1),
      ),
      body: Container(
        color: Colors.black,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: YoutubePlayer(
            startFullScreen: false,
            showThumbnail: true,
            context: context,
            loop: true,
            source: "${widget.videoUrl}",
            quality: YoutubeQuality.HIGH,
          ),
        ),
      ),
    );
  }
}
