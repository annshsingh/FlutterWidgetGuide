import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class LayoutBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'LayoutBuilder Widget',
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
                builder: (context) => CodeScreen(code: Code.layoutBuilderCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if(constraints.maxWidth < 600 ){
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Expanded(
                      child: Container(color: Colors.lightBlue),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(color: Colors.indigo),
                      flex: 1,
                    )
                ],
              );
            }else{
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(color: Colors.lightBlue),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(color: Colors.indigo),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(color: Colors.pink),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(color: Colors.blue),
                    flex: 1,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
