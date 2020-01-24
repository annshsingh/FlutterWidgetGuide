import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Ads.dart';
import '../Code.dart';
import '../CodeScreen.dart';

class AnimatedListWidget extends StatefulWidget {
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  // the GlobalKey is needed to animate the list
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  // backing data
  List<String> _data = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Last Item'];

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
          'AnimatedList Widget',
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
                builder: (context) => CodeScreen(code: Code.animatedListCode),
              ),
            ),
          )
        ],
      ),
      body: AnimatedList(
        /// Key to call remove and insert item methods from anywhere
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_data[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => _insertSingleItem(),
      ),
    );
  }

  Widget _buildItem(String item, Animation animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 5.0,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 20),
          ),
          trailing: GestureDetector(
            child: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
            onTap: () {
              _removeSingleItems(index);
            },
          ),
        ),
      ),
    );
  }

  /// Method to add an item to an index in a list
  void _insertSingleItem() {
    int insertIndex;
    if (_data.length > 0) {
      insertIndex = _data.length;
    } else {
      insertIndex = 0;
    }
    String item = "Item ${insertIndex + 1}";
    _data.insert(insertIndex, item);
    _listKey.currentState.insertItem(insertIndex);
  }

//  void _insertMultipleItems() {
//    final items = ['Item 1', 'Item 2', 'Item 3'];
//    int insertIndex = 2;
//    _data.insertAll(insertIndex, items);
//    // This is a bit of a hack because currentState doesn't have
//    // an insertAll() method.
//    for (int offset = 0; offset < items.length; offset++) {
//      _listKey.currentState.insertItem(insertIndex + offset);
//    }
//  }

  /// Method to remove an item at an index from the list
  void _removeSingleItems(int removeAt) {
    int removeIndex = removeAt;
    String removedItem = _data.removeAt(removeIndex);
    // This builder is just so that the animation has something
    // to work with before it disappears from view since the original
    // has already been deleted.
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      // A method to build the Card widget.
      return _buildItem(removedItem, animation, removeAt);
    };
    _listKey.currentState.removeItem(removeIndex, builder);
  }

//  void _removeMultipleItems() {
//    int removeIndex = 2;
//    int count = 2;
//    for (int i = 0; i < count; i++) {
//      String removedItem = _data.removeAt(removeIndex);
//      AnimatedListRemovedItemBuilder builder = (context, animation) {
//        return _buildItem(removedItem, animation);
//      };
//      _listKey.currentState.removeItem(removeIndex, builder);
//    }
//  }
}
