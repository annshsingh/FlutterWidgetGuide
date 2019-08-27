import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_guide/utils.dart';

class ReorderableListViewWidget extends StatefulWidget {
  @override
  _ReorderableListViewWidgetState createState() =>
      _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  final List _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ReorderableListView Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (final item in _items)
            Container(
              width: double.infinity,
              height: 100.0,

              /// Unique key for each item so that reorderable list can
              /// identify them
              key: ValueKey(item),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                  bottom: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                ),
              ),
              child: Center(
                child: ListTile(
                  title: Text("Item $item"),
                  leading: Icon(
                    Icons.drag_handle,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            )
        ],
        header: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 24.0, left: 16.0, right: 16.0),
          child: Text(
            "This is an optional header. Long press and drag any item"
            " below to move it",
            textAlign: TextAlign.center,
          ),
        ),
        onReorder: (oldIndex, newIndex) {
          setState(
            () {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            },
          );
        },
      ),
    );
  }
}
