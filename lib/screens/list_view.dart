import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final List<String> entries = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
    'Item 14',
    'Item 15'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ListView Widget',
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
                    CodeScreen(code: Code.fractionallySizedBoxCode),
              ),
            ),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
        itemCount: entries.length,
        reverse: false,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue[500],
            child: ListTile(
              leading: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              title: Text(
                "Person ${index + 1}",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "${entries[index]}",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => null,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
        ),
      ),
    );
  }
}
