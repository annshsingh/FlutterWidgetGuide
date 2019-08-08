import 'package:flutter/material.dart';

class ListItem {
  String title;
  String description;
  String url;
  String mediumUrl;
  String videoUrl;
  BuildContext context;
  Color menuColor;

  ListItem(
      {this.title,
        this.context,
        this.description,
        this.url,
        this.mediumUrl,
        this.videoUrl,
        this.menuColor = Colors.white});
}