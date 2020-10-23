import 'dart:async';

import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/viewmodel/list_viewmodel.dart';

class ListBloc {
  final _listViewModel = ListViewModel();
  final _listController = StreamController<List<ListItem>>();

  Stream<List<ListItem>> get listItems => _listController.stream;

  ListBloc() {
    _listController.add(_listViewModel.getListItems());
  }

  void filter(String searchQuery) {
    List<ListItem> _filteredList = _listViewModel
        .getListItems()
        .where((ListItem listItem) =>
            listItem.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    _listController.sink.add(_filteredList);
  }
}
