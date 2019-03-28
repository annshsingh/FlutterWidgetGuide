import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Utils {


  /*
   * Method to handle launching of URL
   */
  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static List<Color> buttonGradient = [
    Colors.cyan.shade600,
    Colors.blue.shade600
  ];

  //routes
  static const String homeRoute = "/home";
  static const String safeArea = "/Safe Area";
  static const String expanded = "/Expanded";
  static const String wrap = "/Wrap";
  static const String animatedContainer = "/Animated Container";
  static const String opacity = "/Opacity";
  static const String futureBuilder = "/Future Builder";
  static const String fadeTransition = "/Fade Transition";
  static const String floatingActionButton = "/Floating Action Button";
  static const String pageView = "/Page View";
  static const String table = "/Table";
  static const String sliverAppBar = "/Sliver App Bar";
  static const String sliverList = "/Sliver List";
  static const String sliverGrid = "/Sliver Grid";
  static const String fadeInImage = "/Fade In Image";
  static const String streamBuilder = "/Stream Builder";
  static const String inheritedModel = "/Inherited Model";
  static const String clipRRect = "/ClipRRect";
  static const String hero = "/Hero";
  static const String customPaint = "/Custom Paint";
  static const String tooltip = "/Tooltip";
  static const String fittedBox = "/Fitted Box";
  static const String layoutBuilder = "/Layout Builder";
  static const String absorbPointer = "/Absorb Pointer";
  static const String transform = "/Transform";
  static const String backDropFilter = "/Back Drop Filter";
  static const String align = "/Align";
  static const String animatedBuilder = "/Animated Builder";

  //strings
  static const String appName = "Flutter Widget Guide";

  //fonts
  static const String ubuntuFont = "Ubuntu";
  static const String crimsonFont = "Crimson";
  static const String ubuntuRegularFont = "Ubuntu-Regular.ttf";
  static const String crimsonRegularFont = "CrimsonText-Regular.ttf";

  //descriptions
  static const String safeAreaDescription = "Rounded corner and notches complicate the layout of your app."
      "\nWrap your main widget with this widget to prevent unnecessary clipping and overlapping."
      "\nIt uses MediaQuery to measure the screen dimensions and create necessary padding for your app on the devices (both iOS and Android). "
      "\nFor more info click the link below";
  static const String expandedDescription = "The most common layout widgets used in flutter are rows and columns."
      "\nYou can adjust the children of these parent layouts in many ways like placing them together, distribute the"
      "\navailable space equally etc. If a child is wrapped in Expanded widget then it'll stretch to occupy the left over space. "
      "\nThe priority of expansion is set using the flex value.";
  static const String wrapDescription = "This widget is just like a column or a row widget. The difference is just that it does not face"
      "issues like running out of room on the screen."
      "\nWhat is does is it wraps to the next line when it runs out of space.";
  static const String animatedContainerDescription = "Custom description will be here";
  static const String opacityDescription = "Custom description will be here";
  static const String futureBuilderDescription = "Custom description will be here";
  static const String fadeTransitionDescription = "Custom description will be here";
  static const String floatingActionButtonDescription = "Custom description will be here";
  static const String pageViewDescription = "Custom description will be here";
  static const String tableDescription = "Custom description will be here";
  static const String sliverAppBarDescription = "Custom description will be here";
  static const String sliverListDescription = "Custom description will be here";
  static const String sliverGridDescription = "Custom description will be here";
  static const String fadeInImageDescription = "Custom description will be here";
  static const String streamBuilderDescription = "Custom description will be here";
  static const String inheritedModelDescription = "Custom description will be here";
  static const String clipRRectDescription = "Custom description will be here";
  static const String heroDescription = "Custom description will be here";
  static const String customPaintDescription = "Custom description will be here";
  static const String tooltipDescription = "Custom description will be here";
  static const String fittedBoxDescription = "Custom description will be here";
  static const String layoutBuilderDescription = "Custom description will be here";
  static const String absorbPointerDescription = "Custom description will be here";
  static const String transformDescription = "Custom description will be here";
  static const String backDropFilterDescription = "Custom description will be here";
  static const String alignDescription = "Custom description will be here";
  static const String animatedBuilderDescription = "Custom description will be here";

  //urls
  static const String safeAreaURL = "https://docs.flutter.io/flutter/widgets/SafeArea-class.html";
  static const String expandedURL = "https://docs.flutter.io/flutter/widgets/Expanded-class.html";
  static const String wrapURL = "https://docs.flutter.io/flutter/widgets/Wrap-class.html";
  static const String animatedContainerURL = "https://docs.flutter.io/flutter/widgets/AnimatedContainer-class.html";
  static const String opacityURL = "https://docs.flutter.io/flutter/widgets/Opacity-class.html";
  static const String futureBuilderURL = "https://docs.flutter.io/flutter/widgets/FutureBuilder-class.html";
  static const String fadeTransitionURL = "https://docs.flutter.io/flutter/widgets/FadeTransition-class.html";
  static const String floatingActionButtonURL = "https://docs.flutter.io/flutter/material/FloatingActionButton-class.html";
  static const String pageViewURL = "https://docs.flutter.io/flutter/widgets/PageView-class.html";
  static const String tableURL = "https://docs.flutter.io/flutter/widgets/Table-class.html";
  static const String sliverAppBarURL = "https://docs.flutter.io/flutter/material/SliverAppBar-class.html";
  static const String sliverListURL = "https://docs.flutter.io/flutter/widgets/SliverList-class.html";
  static const String sliverGridURL = "https://docs.flutter.io/flutter/widgets/SliverGrid-class.html";
  static const String fadeInImageURL = "https://docs.flutter.io/flutter/widgets/FadeInImage-class.html";
  static const String streamBuilderURL = "https://docs.flutter.io/flutter/widgets/StreamBuilder-class.html";
  static const String inheritedModelURL = "https://docs.flutter.io/flutter/widgets/InheritedModel-class.html";
  static const String clipRRectURL = "https://docs.flutter.io/flutter/widgets/ClipRRect-class.html";
  static const String heroURL = "https://docs.flutter.io/flutter/widgets/Hero-class.html";
  static const String customPaintURL = "https://docs.flutter.io/flutter/widgets/CustomPaint-class.html";
  static const String tooltipURL = "https://docs.flutter.io/flutter/material/Tooltip-class.html";
  static const String fittedBoxURL = "https://docs.flutter.io/flutter/widgets/FittedBox-class.html";
  static const String layoutBuilderURL = "https://docs.flutter.io/flutter/widgets/LayoutBuilder-class.html";
  static const String absorbPointerURL = "https://docs.flutter.io/flutter/widgets/AbsorbPointer-class.html";
  static const String transformURL = "https://docs.flutter.io/flutter/widgets/Transform-class.html";
  static const String backDropFilterURL = "https://docs.flutter.io/flutter/widgets/BackdropFilter-class.html";
  static const String alignURL = "https://docs.flutter.io/flutter/widgets/Align-class.html";
  static const String animatedBuilderURL = "https://docs.flutter.io/flutter/widgets/AnimatedBuilder-class.html";

  static const String expandedSourceURL = "https://github.com/annshsingh/flutter-widget-guide/blob/master/lib/screens/expanded.dart";

  //images
  static const String imageDir = "assets/images";
  static const String expanded_img = "$imageDir/expanded_info.svg";

}