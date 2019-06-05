import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

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

  ///Method to get a random color
  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(
          1.0);

  static List<Color> buttonGradient = [
    Colors.cyan.shade600,
    Colors.blue.shade600
  ];

  //routes
  static const String codeRoute = "/code";
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
  static const String hero2 = "/Hero2";
  static const String customPaint = "/Custom Paint";
  static const String tooltip = "/Tooltip";
  static const String fittedBox = "/Fitted Box";
  static const String layoutBuilder = "/Layout Builder";
  static const String absorbPointer = "/Absorb Pointer";
  static const String transform = "/Transform";
  static const String backDropFilter = "/Back Drop Filter";
  static const String align = "/Align";
  static const String positioned = "/Positioned";
  static const String animatedBuilder = "/Animated Builder";
  static const String dismissible = "/Dismissible";
  static const String sizedBox = "/Sized Box";
  static const String valueListenableBuilder = "/Value Listenable Builder";

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
  static const String animatedContainerDescription = "This is one of flutter's implicit animation widget. Make changes to this widget itself"
      " to perform animations or wrap another widget with this one to animate it.\nEvery change made will be reflected with an animation.";
  static const String opacityDescription = "This widget is used to change the visibility of a widget. The change can be sudden or with an animation.";
  static const String futureBuilderDescription = "This widget lets you control your UI depending on the state of the Future connected with it. You "
      "can show a widget while your future is busy and then another one when data is available.";
  static const String fadeTransitionDescription = "This widget lets you fade another widget in and out. You add a child and provide it with an"
      " animation. We use Animation Controller to control the animation.";
  static const String floatingActionButtonDescription = "This widget lets to place a FAB on the screen. It works really well with the BottomAppBar."
      " You can change the shape, size and position of the FAB according to your needs.";
  static const String pageViewDescription = "This widget is used to create a screen with multiple pages. You can easily swipe through them. You can"
      " also control the scroll direction property and set it to horizontal or vertical.";
  static const String tableDescription = "If you have a group of widgets with varying dimentions then it can be difficult to create a custom table of diffrent"
      " rows and columns. Here is when Table Widget comes to the rescue. This widget accomodates all of its children easily.";
  static const String sliverAppBarDescription = "This widget allows you to create a collapsing app bar that animates as you scroll. This widget is used"
      " with CustomScrollView Widget to provide the scroll behaviour for the app bar.";
  static const String sliverListDescription = "This widget lets you build a list of items. It generates it's item lazily as they scroll into view and is"
      " efficient for a list with large dataset.";
  static const String sliverGridDescription = "This widget lets you build a list of items that you can arrange in form of a Grid. It generates it's item"
      " lazily as they scroll into view and is efficient for a list with large dataset.";
  static const String fadeInImageDescription = "This widget lets you display a placeholder while your app fetches image from the network. You can use this"
      " in your list of feed or while loading profile image in you app.";
  static const String streamBuilderDescription = "This widget lets you build you UI while listning to a stream of data. It rebuilds itsrlf for every new event";
  static const String inheritedModelDescription = "This widget lets you control properties of decendent widgets depending on the properties of the ancestor widget"
      " This can be of use in case of nested widgets.";
  static const String clipRRectDescription = "This widget lets you smooth out the corners of your other widgets. You can specify a radius value and"
      " the corners will be clipped. You can specify the clicp behaviour as well";
  static const String heroDescription = "This widget lets you perform hero transition in your app. This helps user to know that they have switched screens"
      " while maintaining the focus. You can change the shape of widgets as well and this widget will create smooth shape transitions as you go from "
      " one screen to another";
  static const String customPaintDescription = "This widget lets you create your own custom UI elements. You can build Lines, paths, ectangles, circles"
      " arcs, images etc. You have the full control of the properties of this widget.";
  static const String tooltipDescription = "This widget lets you provide additional information of a widget. People with impared vision can long press on"
      " a widget to get an audio feedback of what it is. Similarly, you can provide information for an icon as to what will happen if a user"
      " clicks on it.";
  static const String fittedBoxDescription = "This widget lets you define the rules for the child widgets to follow while adjusting themselves to fit inside"
      " the parent widget. The child widget might scale or have to be clipped depending on the fit type.";
  static const String layoutBuilderDescription = "This widget lets you make smrt decisions regarding your layout. You can make use of constraints and decide what kind"
      " of a layout you want your users to see.";
  static const String absorbPointerDescription = "This widget lets you control the touch events for the widgets. If enabled, none of the widgets wrapped"
      " with this widget will be able to detect user touch events.";
  static const String transformDescription = "This widget lets you transform a widget's scaling, ratation or positional properties. These are some basic ones"
      ", you can create some really cool animations with this widget as well.";
  static const String backDropFilterDescription = "This widget lets you apply a filter over other widgets. For example, if you want to blur out a specific"
      " part of an image. This widget works best with a Stack widget.";
  static const String alignDescription = "This widget lets you position a child widget inside it's parent widget. You can place the child widget at the center,"
      " left corner or right corner to name a few.";
  static const String positionedDescription = "This widget lets you positon a widget inside a Stack. You can provide a widget with custom positions with the help of"
      " properties like - top, bottom, left, right";
  static const String animatedBuilderDescription = "This widget lets you change properties of a widget like size, roatation etc with an animation.";
  static const String dismissibleDescription = "This widget lets you create a dismissible list item. You can cutomize the left and right swipe gestures"
      " in terms of the UI";
  static const String sizedBoxDescription = "This widget lets you give a fixed size to the child widget. This widget can also be used to create a gap between"
      " two widgets.";
  static const String valueListenableBuilderDescription = "";


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
  static const String positionedURL = "https://docs.flutter.io/flutter/widgets/Positioned-class.html";
  static const String animatedBuilderURL = "https://docs.flutter.io/flutter/widgets/AnimatedBuilder-class.html";
  static const String dismissibleURL = "https://docs.flutter.io/flutter/widgets/Dismissible-class.html";
  static const String sizedBoxURL = "https://docs.flutter.io/flutter/widgets/SizedBox-class.html";
  static const String valueListenableBuilderURL = "https://docs.flutter.io/flutter/widgets/ValueListenableBuilder-class.html";

  static const String expandedSourceURL = "https://github.com/annshsingh/flutter-widget-guide/blob/master/lib/screens/expanded.dart";

  //images
  static const String imageDir = "assets/images";
  static const String expanded_img = "$imageDir/expanded_info.svg";

}