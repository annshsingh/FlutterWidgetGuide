import 'package:flutter/material.dart';

class ListItem {
  String title;
  String description;
  String url;
  BuildContext context;
  Color menuColor;

  ListItem(
      {this.title,
        this.context,
        this.description,
        this.url,
        this.menuColor = Colors.white});
}