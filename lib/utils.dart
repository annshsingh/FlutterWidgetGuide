import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  ///Method to get a random color
  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  static List<Color> buttonGradient = [
    Colors.cyan.shade600,
    Colors.blue.shade600
  ];

  //routes
  static const String codeRoute = "/code";
  static const String videoView = "/video";
  static const String webView = "/webview";
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
  static const String draggable = "/Draggable";
  static const String animatedList = "/AnimatedList";
  static const String flexible = "/Flexible";
  static const String mediaQuery = "/MediaQuery";
  static const String spacer = "/Spacer";
  static const String inheritedWidget = "/InheritedWidget";
  static const String animatedIcon = "/AnimatedIcon";
  static const String aspectRatio = "/AspectRatio";
  static const String limitedBox = "/LimitedBox";
  static const String placeholder = "/Placeholder";
  static const String richText = "/RichText";
  static const String reorderableListView = "/ReorderableListView";
  static const String animatedSwitcher = "/AnimatedSwitcher";
  static const String animatedPositioned = "/AnimatedPositioned";
  static const String animatedPadding = "/AnimatedPadding";

  //strings
  static const String appName = "Flutter Widget Guide";

  //fonts
  static const String ubuntuFont = "Ubuntu";
  static const String crimsonFont = "Crimson";
  static const String ubuntuRegularFont = "Ubuntu-Regular.ttf";
  static const String crimsonRegularFont = "CrimsonText-Regular.ttf";

  //descriptions
  static const String safeAreaDescription =
      "Rounded corner and notches complicate the layout of your app."
      "\nWrap your main widget with this widget to prevent unnecessary clipping and overlapping."
      "\nIt uses MediaQuery to measure the screen dimensions and create necessary padding for your app on the devices (both iOS and Android). "
      "\nFor more info click the link below";
  static const String expandedDescription =
      "The most common layout widgets used in flutter are rows and columns."
      "\nYou can adjust the children of these parent layouts in many ways like placing them together, distribute the"
      "\navailable space equally etc. If a child is wrapped in Expanded widget then it'll stretch to occupy the left over space. "
      "\nThe priority of expansion is set using the flex value.";
  static const String wrapDescription =
      "This widget is just like a column or a row widget. The difference is just that it does not face"
      "issues like running out of room on the screen."
      "\nWhat is does is it wraps to the next line when it runs out of space.";
  static const String animatedContainerDescription =
      "This is one of flutter's implicit animation widget. Make changes to this widget itself"
      " to perform animations or wrap another widget with this one to animate it.\nEvery change made will be reflected with an animation.";
  static const String opacityDescription =
      "This widget is used to change the visibility of a widget. The change can be sudden or with an animation.";
  static const String futureBuilderDescription =
      "This widget lets you control your UI depending on the state of the Future connected with it. You "
      "can show a widget while your future is busy and then another one when data is available.";
  static const String fadeTransitionDescription =
      "This widget lets you fade another widget in and out. You add a child and provide it with an"
      " animation. We use Animation Controller to control the animation.";
  static const String floatingActionButtonDescription =
      "This widget lets to place a FAB on the screen. It works really well with the BottomAppBar."
      " You can change the shape, size and position of the FAB according to your needs.";
  static const String pageViewDescription =
      "This widget is used to create a screen with multiple pages. You can easily swipe through them. You can"
      " also control the scroll direction property and set it to horizontal or vertical.";
  static const String tableDescription =
      "If you have a group of widgets with varying dimentions then it can be difficult to create a custom table of diffrent"
      " rows and columns. Here is when Table Widget comes to the rescue. This widget accomodates all of its children easily.";
  static const String sliverAppBarDescription =
      "This widget allows you to create a collapsing app bar that animates as you scroll. This widget is used"
      " with CustomScrollView Widget to provide the scroll behaviour for the app bar.";
  static const String sliverListDescription =
      "This widget lets you build a list of items. It generates it's item lazily as they scroll into view and is"
      " efficient for a list with large dataset.";
  static const String sliverGridDescription =
      "This widget lets you build a list of items that you can arrange in form of a Grid. It generates it's item"
      " lazily as they scroll into view and is efficient for a list with large dataset.";
  static const String fadeInImageDescription =
      "This widget lets you display a placeholder while your app fetches image from the network. You can use this"
      " in your list of feed or while loading profile image in you app.";
  static const String streamBuilderDescription =
      "This widget lets you build you UI while listning to a stream of data. It rebuilds itsrlf for every new event";
  static const String inheritedModelDescription =
      "This widget lets you control properties of decendent widgets depending on the properties of the ancestor widget"
      " This can be of use in case of nested widgets.";
  static const String clipRRectDescription =
      "This widget lets you smooth out the corners of your other widgets. You can specify a radius value and"
      " the corners will be clipped. You can specify the clicp behaviour as well";
  static const String heroDescription =
      "This widget lets you perform hero transition in your app. This helps user to know that they have switched screens"
      " while maintaining the focus. You can change the shape of widgets as well and this widget will create smooth shape transitions as you go from "
      " one screen to another";
  static const String customPaintDescription =
      "This widget lets you create your own custom UI elements. You can build Lines, paths, ectangles, circles"
      " arcs, images etc. You have the full control of the properties of this widget.";
  static const String tooltipDescription =
      "This widget lets you provide additional information of a widget. People with impared vision can long press on"
      " a widget to get an audio feedback of what it is. Similarly, you can provide information for an icon as to what will happen if a user"
      " clicks on it.";
  static const String fittedBoxDescription =
      "This widget lets you define the rules for the child widgets to follow while adjusting themselves to fit inside"
      " the parent widget. The child widget might scale or have to be clipped depending on the fit type.";
  static const String layoutBuilderDescription =
      "This widget lets you make smrt decisions regarding your layout. You can make use of constraints and decide what kind"
      " of a layout you want your users to see.";
  static const String absorbPointerDescription =
      "This widget lets you control the touch events for the widgets. If enabled, none of the widgets wrapped"
      " with this widget will be able to detect user touch events.";
  static const String transformDescription =
      "This widget lets you transform a widget's scaling, ratation or positional properties. These are some basic ones"
      ", you can create some really cool animations with this widget as well.";
  static const String backDropFilterDescription =
      "This widget lets you apply a filter over other widgets. For example, if you want to blur out a specific"
      " part of an image. This widget works best with a Stack widget.";
  static const String alignDescription =
      "This widget lets you position a child widget inside it's parent widget. You can place the child widget at the center,"
      " left corner or right corner to name a few.";
  static const String positionedDescription =
      "This widget lets you positon a widget inside a Stack. You can provide a widget with custom positions with the help of"
      " properties like - top, bottom, left, right";
  static const String animatedBuilderDescription =
      "This widget lets you change properties of a widget like size, roatation etc with an animation.";
  static const String dismissibleDescription =
      "This widget lets you create a dismissible list item. You can cutomize the left and right swipe gestures"
      " in terms of the UI";
  static const String sizedBoxDescription =
      "This widget lets you give a fixed size to the child widget. This widget can also be used to create a gap between"
      " two widgets.";
  static const String valueListenableBuilderDescription = "Coming Soon :)";
  static const String draggableDescription = "Coming Soon :)";
  static const String animatedListDescription = "Coming Soon :)";
  static const String flexibleDescription = "Coming Soon :)";
  static const String mediaQueryDescription = "Coming Soon :)";
  static const String spacerDescription = "Coming Soon :)";
  static const String inheritedWidgetDescription = "";
  static const String animatedIconDescription = "Coming Soon :)";
  static const String aspectRatioDescription = "Coming Soon :)";
  static const String limitedBoxDescription = "Coming Soon :)";
  static const String placeholderDescription = "Coming Soon :)";
  static const String richTextDescription = "Coming Soon :)";
  static const String reorderableListViewDescription = "";
  static const String animatedSwitcherDescription = "";
  static const String animatedPositionedDescription = "";
  static const String animatedPaddingDescription = "";

  //official urls
  static const String safeAreaURL =
      "https://api.flutter.dev/flutter/widgets/SafeArea-class.html";
  static const String expandedURL =
      "https://api.flutter.dev/flutter/widgets/Expanded-class.html";
  static const String wrapURL =
      "https://api.flutter.dev/flutter/widgets/Wrap-class.html";
  static const String animatedContainerURL =
      "https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html";
  static const String opacityURL =
      "https://api.flutter.dev/flutter/widgets/Opacity-class.html";
  static const String futureBuilderURL =
      "https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html";
  static const String fadeTransitionURL =
      "https://api.flutter.dev/flutter/widgets/FadeTransition-class.html";
  static const String floatingActionButtonURL =
      "https://api.flutter.dev/flutter/material/FloatingActionButton-class.html";
  static const String pageViewURL =
      "https://api.flutter.dev/flutter/widgets/PageView-class.html";
  static const String tableURL =
      "https://api.flutter.dev/flutter/widgets/Table-class.html";
  static const String sliverAppBarURL =
      "https://api.flutter.dev/flutter/material/SliverAppBar-class.html";
  static const String sliverListURL =
      "https://api.flutter.dev/flutter/widgets/SliverList-class.html";
  static const String sliverGridURL =
      "https://api.flutter.dev/flutter/widgets/SliverGrid-class.html";
  static const String fadeInImageURL =
      "https://api.flutter.dev/flutter/widgets/FadeInImage-class.html";
  static const String streamBuilderURL =
      "https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html";
  static const String inheritedModelURL =
      "https://api.flutter.dev/flutter/widgets/InheritedModel-class.html";
  static const String clipRRectURL =
      "https://api.flutter.dev/flutter/widgets/ClipRRect-class.html";
  static const String heroURL =
      "https://api.flutter.dev/flutter/widgets/Hero-class.html";
  static const String customPaintURL =
      "https://api.flutter.dev/flutter/widgets/CustomPaint-class.html";
  static const String tooltipURL =
      "https://api.flutter.dev/flutter/material/Tooltip-class.html";
  static const String fittedBoxURL =
      "https://api.flutter.dev/flutter/widgets/FittedBox-class.html";
  static const String layoutBuilderURL =
      "https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html";
  static const String absorbPointerURL =
      "https://api.flutter.dev/flutter/widgets/AbsorbPointer-class.html";
  static const String transformURL =
      "https://api.flutter.dev/flutter/widgets/Transform-class.html";
  static const String backDropFilterURL =
      "https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html";
  static const String alignURL =
      "https://api.flutter.dev/flutter/widgets/Align-class.html";
  static const String positionedURL =
      "https://api.flutter.dev/flutter/widgets/Positioned-class.html";
  static const String animatedBuilderURL =
      "https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html";
  static const String dismissibleURL =
      "https://api.flutter.dev/flutter/widgets/Dismissible-class.html";
  static const String sizedBoxURL =
      "https://api.flutter.dev/flutter/widgets/SizedBox-class.html";
  static const String valueListenableBuilderURL =
      "https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html";
  static const String draggableURL =
      "https://api.flutter.dev/flutter/widgets/Draggable-class.html";
  static const String animatedListURL =
      "https://api.flutter.dev/flutter/widgets/AnimatedList-class.html";
  static const String flexibleURL =
      "https://api.flutter.dev/flutter/widgets/Flexible-class.html";
  static const String mediaQueryURL =
      "https://api.flutter.dev/flutter/widgets/MediaQuery-class.html";
  static const String spacerURL =
      "https://api.flutter.dev/flutter/widgets/Spacer-class.html";
  static const String inheritedWidgetURL =
      "https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html";
  static const String animatedIconURL =
      "https://api.flutter.dev/flutter/material/AnimatedIcon-class.html";
  static const String aspectRatioURL =
      "https://api.flutter.dev/flutter/widgets/AspectRatio-class.html";
  static const String limitedBoxURL =
      "https://api.flutter.dev/flutter/widgets/LimitedBox-class.html";
  static const String placeholderURL =
      "https://api.flutter.dev/flutter/widgets/Placeholder-class.html";
  static const String richTextURL =
      "https://api.flutter.dev/flutter/widgets/RichText-class.html";
  static const String reorderableListViewURL =
      "https://api.flutter.dev/flutter/widgets/ReorderableListView-class.html";
  static const String animatedSwitcherURL =
      "https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html";
  static const String animatedPositionedURL =
      "https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html";
  static const String animatedPaddingURL =
      "https://api.flutter.dev/flutter/widgets/AnimatedPadding-class.html";

  static const String expandedSourceURL =
      "https://github.com/annshsingh/flutter-widget-guide/blob/master/lib/screens/expanded.dart";

  //video urls
  static const String safeAreaVideoUrl =
      "https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=2";
  static const String expandedVideoUrl =
      "https://www.youtube.com/watch?v=_rnZaagadyo&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=3";
  static const String wrapVideoUrl =
      "https://www.youtube.com/watch?v=z5iw2SeFx2M&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=4";
  static const String animatedContainerVideoUrl =
      "https://www.youtube.com/watch?v=yI-8QHpGIP4&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=5";
  static const String opacityVideoUrl =
      "https://www.youtube.com/watch?v=9hltevOHQBw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=6";
  static const String futureBuilderVideoUrl =
      "https://www.youtube.com/watch?v=ek8ZPdWj4Qo&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=7";
  static const String fadeTransitionVideoUrl =
      "https://www.youtube.com/watch?v=rLwWVbv3xDQ&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=8";
  static const String fabVideoUrl =
      "https://www.youtube.com/watch?v=2uaoEDOgk_I&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=9";
  static const String pageViewVideoUrl =
      "https://www.youtube.com/watch?v=J1gE9xvph-A&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=10";
  static const String tableVideoUrl =
      "https://www.youtube.com/watch?v=_lbE0wsVZSw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=11";
  static const String sliverAppBarVideoUrl =
      "https://www.youtube.com/watch?v=R9C5KMJKluE&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=12";
  static const String sliverListVideoUrl =
      "https://www.youtube.com/watch?v=ORiTTaVY6mM&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=13";
  static const String sliverGridVideoUrl =
      "https://www.youtube.com/watch?v=ORiTTaVY6mM&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=13";
  static const String fadeInImageVideoUrl =
      "https://www.youtube.com/watch?v=pK738Pg9cxc&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=14";
  static const String streamBuilderVideoUrl =
      "https://www.youtube.com/watch?v=MkKEWHfy99Y&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=15";
  static const String inheritedModelVideoUrl =
      "https://www.youtube.com/watch?v=ml5uefGgkaA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=16";
  static const String clipRrectVideoUrl =
      "https://www.youtube.com/watch?v=eI43jkQkrvs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=17";
  static const String heroVideoUrl =
      "https://www.youtube.com/watch?v=Be9UH1kXFDw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=18";
  static const String customPaintVideoUrl =
      "https://www.youtube.com/watch?v=kp14Y4uHpHs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=19";
  static const String toolTipVideoUrl =
      "https://www.youtube.com/watch?v=EeEfD5fI-5Q&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=20";
  static const String fittedBoxVideoUrl =
      "https://www.youtube.com/watch?v=T4Uehk3_wlY&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=21";
  static const String layoutBuilderVideoUrl =
      "https://www.youtube.com/watch?v=IYDVcriKjsw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=22";
  static const String absorbPointerVideoUrl =
      "https://www.youtube.com/watch?v=65HoWqBboI8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=23";
  static const String transformVideoUrl =
      "https://www.youtube.com/watch?v=9z_YNlRlWfA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=24";
  static const String backdropVideoUrl =
      "https://www.youtube.com/watch?v=dYRs7Q1vfYI&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=25";
  static const String alignVideoUrl =
      "https://www.youtube.com/watch?v=g2E7yl3MwMk&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=26";
  static const String positionedVideoUrl =
      "https://www.youtube.com/watch?v=EgtPleVwxBQ&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=27";
  static const String animatedBuilderVideoUrl =
      "https://www.youtube.com/watch?v=N-RiyZlv8v8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=28";
  static const String dismissibleVideoUrl =
      "https://www.youtube.com/watch?v=iEMgjrfuc58&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=29";
  static const String sizedBoxVideoUrl =
      "https://www.youtube.com/watch?v=EHPu_DzRfqA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=30";
  static const String valueListenableBuilderVideoUrl =
      "https://www.youtube.com/watch?v=s-ZG-jS5QHQ&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=31";
  static const String draggableVideoUrl =
      "https://www.youtube.com/watch?v=QzA4c4QHZCY&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=32";
  static const String animatedListVideoUrl =
      "https://www.youtube.com/watch?v=ZtfItHwFlZ8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=33";
  static const String flexibleVideoUrl =
      "https://www.youtube.com/watch?v=CI7x0mAZiY0&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=34";
  static const String mediaqueryVideoUrl =
      "https://www.youtube.com/watch?v=A3WrA4zAaPw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=35";
  static const String spacerVideoUrl =
      "https://www.youtube.com/watch?v=7FJgd7QN1zI&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=36";
  static const String inheritedWidgetVideoUrl =
      "https://www.youtube.com/watch?v=1t-8rBCGBYw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=37";
  static const String animatedIconVideoUrl =
      "https://www.youtube.com/watch?v=pJcbh8pbvJs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=38";
  static const String aspectRatioVideoUrl =
      "https://www.youtube.com/watch?v=XcnP3_mO_Ms&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=39";
  static const String limitedBoxVideoUrl =
      "https://www.youtube.com/watch?v=uVki2CIzBTs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=40";
  static const String placeholderVideoUrl =
      "https://www.youtube.com/watch?v=LPe56fezmoo&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=41";
  static const String richTextVideoUrl =
      "https://www.youtube.com/watch?v=rykDVh-QFfw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=42";
  static const String reorderableListViewVideoUrl =
      "https://www.youtube.com/watch?v=3fB1mxOsqJE&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=43";
  static const String animatedSwitcherVideoUrl =
      "https://www.youtube.com/watch?v=2W7POjFb88g&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=44";
  static const String animatedPositionedVideoUrl =
      "https://www.youtube.com/watch?v=hC3s2YdtWt8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=45";
  static const String animatedPaddingVideoUrl =
      "https://www.youtube.com/watch?v=PY2m0fhGNz4&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=46";

  //medium urls
  static const String safeAreaMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-safearea-widget-in-5-mins-or-less-df4620a7d08f";
  static const String expandedMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-expanded-widget-in-5-mins-or-less-7fac99839658";
  static const String wrapMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-wrap-widget-in-5-mins-or-less-f77ad249c176";
  static const String animatedContainerMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-animatedcontainer-widget-in-5-mins-or-less-347b69eaad0f";
  static const String opacityMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-opacity-widget-in-5-mins-or-less-969c3f635437";
  static const String futureBuilderMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-futurebuilder-widget-in-5-mins-or-less-3bef3e5e1bff";
  static const String fadeTransitionMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-fadetransition-widget-in-5-mins-or-less-78e714ba722";
  static const String fabMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-fab-widget-in-5-mins-or-less-bbf84db22d3c";
  static const String pageViewMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-pageview-widget-in-5-mins-or-less-bc7968f264ac";
  static const String tableMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-table-widget-in-5-mins-or-less-9b7f7f796014";
  static const String sliverAppBarMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-sliverappbar-widget-in-5-mins-or-less-d39ae4bf98c8";
  static const String sliverListMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-sliverlist-widget-in-5-mins-or-less-d1215c677388";
  static const String sliverGridMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-slivergrid-widget-in-5-mins-or-less-e6a95d6c4e76";
  static const String fadeInImageMediumUrl =
      "https://medium.com/flutter-community/flutter-widget-guide-fadeinimage-widget-in-5-mins-or-less-2659a9aa5bfd";
  static const String streamBuilderMediumUrl = "";
  static const String inheritedModelMediumUrl = "";
  static const String clipRrectMediumUrl = "";
  static const String heroMediumUrl = "";
  static const String customPaintMediumUrl = "";
  static const String toolTipMediumUrl = "";
  static const String fittedBoxMediumUrl = "";
  static const String layoutBuilderMediumUrl = "";
  static const String absorbPointerMediumUrl = "";
  static const String transformMediumUrl = "";
  static const String backdropMediumUrl = "";
  static const String alignMediumUrl = "";
  static const String positionedMediumUrl = "";
  static const String animatedBuilderMediumUrl = "";
  static const String dismissibleMediumUrl = "";
  static const String sizedBoxMediumUrl = "";
  static const String valueListenableBuilderMediumUrl = "";
  static const String draggableMediumUrl = "";
  static const String animatedListMediumUrl = "";
  static const String flexibleMediumUrl = "";
  static const String mediaqueryMediumUrl = "";
  static const String spacerMediumUrl = "";
  static const String inheritedWidgetMediumUrl = "";
  static const String animatedIconMediumUrl = "";
  static const String aspectRatioMediumUrl = "";
  static const String limitedBoxMediumUrl = "";
  static const String placeholderMediumUrl = "";
  static const String richTextMediumUrl = "";
  static const String reorderableListViewMediumUrl = "";
  static const String animatedSwitcherMediumUrl = "";
  static const String animatedPositionedMediumUrl = "";
  static const String animatedPaddingMediumUrl = "";

  //images
  static const String imageDir = "assets/images";
  static const String expanded_img = "$imageDir/expanded_info.svg";
  static const String medium_img = "$imageDir/medium_icon.svg";
}
