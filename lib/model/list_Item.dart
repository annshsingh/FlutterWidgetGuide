import 'package:flutter/material.dart';

class ListItem {
  String title;
  String description;
  String url;
  String videoUrl;
  BuildContext context;
  Color menuColor;

  ListItem(
      {this.title,
        this.context,
        this.description,
        this.url,
        this.videoUrl,
        this.menuColor = Colors.white});
}