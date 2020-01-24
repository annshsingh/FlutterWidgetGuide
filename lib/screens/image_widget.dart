import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' as painting;
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';

class ImageWidget extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {

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
          'Image Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CodeScreen(code: Code.imageWidgetCode),
                  ),
                ),
          )
        ],
      ),
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Image from assets folder", textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/dp.png',
                    width: 150,
                    height: 150,
                    //Other available properties -
                    //color: Colors.purple,
                    //colorBlendMode: BlendMode.difference,
                    //fit: BoxFit.cover,
                    //semanticLabel: "Display Image",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Image from the network", textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    width: 150,
                    height: 150,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : Container(
                        width: 150,
                        height: 150,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                          ),
                        ),
                      );
                    },
                  ),
                )

                //Other Image sources -

                //Image.file('path/to/imageSrc.png');

                //Image.memory(bytes);
              ],
            ),
          ),
        ),
        onWillPop: _willPopCallback,
      ),
    );
  }
}

Future<bool> _willPopCallback() async {
  ///clear image cache and exit screen
  ///this is done so that the image loads every time you open the
  ///screen. (it is cached otherwise)
  painting.imageCache.clear();
  return true; // return true if the route to be popped
}
