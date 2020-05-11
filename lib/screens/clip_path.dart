import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Code.dart';
import '../CodeScreen.dart';
import '../utils.dart';

class ClipPathWidget extends StatefulWidget {
  @override
  _ClipPathWidgetState createState() => _ClipPathWidgetState();
}

class _ClipPathWidgetState extends State<ClipPathWidget> {
  Color bgColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ClipPath Widget',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.clipPathCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: ClipPath(
          ///specify the clipper with path details here
          clipper: DashClipper(),

          ///specify the view to be clipped here
          child: GestureDetector(
            child: BlueBox(200.0, bgColor),
            onTap: () {
              setState(() {
                bgColor = Utils.getRandomColor();
              });
            },
          ),
        ),
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  final size;
  final bgColor;

  BlueBox(this.size, this.bgColor);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: bgColor),
      child: SizedBox(
        height: size,
        width: size,
      ),
    );
  }
}

///Code from the official documents
class DashClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.6929134, 72.083992);
    path.relativeLineTo(9.7270346, -10.425198);
    path.relativeLineTo(31.091862, 31.963253);
    path.relativeLineTo(19.107612, -22.755906);
    path.relativeLineTo(10.073494, -36.824146);
    path.relativeLineTo(32.482934, -19.800526);
    path.relativeLineTo(-6.2572174, -7.8162728);
    path.relativeLineTo(25.711288, -0.17322826);
    path.relativeLineTo(-6.603676, 7.989501);
    path.relativeLineTo(17.88977, 3.301837);
    path.relativeLineTo(30.225724, 18.23622);
    path.relativeLineTo(9.02887, 18.587928);
    path.relativeLineTo(27.443558, 7.6430436);
    path.relativeLineTo(-27.27034, 6.425194);
    path.relativeLineTo(0.87139892, 19.454071);
    path.relativeLineTo(-11.464569, 22.57743);
    path.relativeLineTo(1.9107666, 13.7217864);
    path.relativeLineTo(14.939621, 2.6089172);
    path.relativeLineTo(-19.627288, 4.5144348);
    path.relativeLineTo(-4.519684, -19.800522);
    path.relativeLineTo(-9.9002686, 15.112862);
    path.relativeLineTo(-33.522308, 5.90551);
    path.relativeLineTo(-30.918632, -13.375328);
    path.relativeLineTo(-40.120736, -11.1181106);
    path.relativeLineTo(-10.9448814, -13.02887);
    path.lineTo(0.6929134, 72.083992);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
