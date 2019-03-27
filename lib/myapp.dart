import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:flutter_widget_guide/screens/home_page.dart';
import 'package:flutter_widget_guide/screens/safe_area.dart';
import 'package:flutter_widget_guide/screens/expanded.dart';
import 'package:flutter_widget_guide/screens/wrap.dart';
import 'package:flutter_widget_guide/screens/animated_container.dart';
import 'package:flutter_widget_guide/screens/opacity.dart';
import 'package:flutter_widget_guide/screens/future_builder.dart';
import 'package:flutter_widget_guide/screens/fade_transition.dart';
import 'package:flutter_widget_guide/screens/floating_action_button.dart';
import 'package:flutter_widget_guide/screens/page_view.dart';
import 'package:flutter_widget_guide/screens/table.dart';
import 'package:flutter_widget_guide/screens/sliver_app_bar.dart';
import 'package:flutter_widget_guide/screens/sliver_list.dart';
import 'package:flutter_widget_guide/screens/sliver_grid.dart';
import 'package:flutter_widget_guide/screens/fade_in_image.dart';
import 'package:flutter_widget_guide/screens/stream_builder.dart';
import 'package:flutter_widget_guide/screens/inherited_model.dart';
import 'package:flutter_widget_guide/screens/clip_r_rect.dart';
import 'package:flutter_widget_guide/screens/hero.dart';
import 'package:flutter_widget_guide/screens/custom_paint.dart';
import 'package:flutter_widget_guide/screens/tooltip.dart';
import 'package:flutter_widget_guide/screens/fitted_box.dart';
import 'package:flutter_widget_guide/screens/layout_builder.dart';
import 'package:flutter_widget_guide/screens/absorb_pointer.dart';
import 'package:flutter_widget_guide/screens/transform.dart';
import 'package:flutter_widget_guide/screens/backdrop_filter.dart';
import 'package:flutter_widget_guide/screens/align.dart';
import 'package:flutter_widget_guide/screens/animated_builder.dart';


class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: Utils.appName,
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: Utils.ubuntuFont,
          canvasColor: Colors.white,
          accentColor: Colors.white,),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),

      // initialRoute: Utils.notFoundRoute,

      //all the app routes are listed here
      routes: <String, WidgetBuilder>{
        Utils.homeRoute: (BuildContext context) => HomePage(),
        Utils.safeArea: (BuildContext context) => SafeAreaWidget(),
        Utils.expanded: (BuildContext context) => ExpandedWidget(),
        Utils.wrap: (BuildContext context) => WrapWidget(),
        Utils.animatedContainer: (BuildContext context) => AnimatedContainerWidget(),
        Utils.opacity: (BuildContext context) => OpacityWidget(),
        Utils.futureBuilder: (BuildContext context) => FutureBuilderWidget(),
        Utils.fadeTransition: (BuildContext context) => FadeTransitionWidget(),
        Utils.floatingActionButton: (BuildContext context) => FloatingActionButtonWidget(),
        Utils.pageView: (BuildContext context) => PageViewWidget(),
        Utils.table: (BuildContext context) => TableWidget(),
        Utils.sliverAppBar: (BuildContext context) => SliverAppBarWidget(),
        Utils.sliverList: (BuildContext context) => SliverListWidget(),
        Utils.sliverGrid: (BuildContext context) => SliverGridWidget(),
        Utils.fadeInImage: (BuildContext context) => FadeInImageWidget(),
        Utils.streamBuilder: (BuildContext context) => StreamBuilderWidget(),
        Utils.inheritedModel: (BuildContext context) => InheritedModelWidget(),
        Utils.clipRRect: (BuildContext context) => ClipRRectWidget(),
        Utils.hero: (BuildContext context) => HeroWidget(),
        Utils.customPaint: (BuildContext context) => CustomPaintWidget(),
        Utils.tooltip: (BuildContext context) => TooltipWidget(),
        Utils.fittedBox: (BuildContext context) => FittedBoxWidget(),
        Utils.layoutBuilder: (BuildContext context) => LayoutBuilderWidget(),
        Utils.absorbPointer: (BuildContext context) => AbsorbPointerWidget(),
        Utils.transform: (BuildContext context) => TransformWidget(),
        Utils.backDropFilter: (BuildContext context) => BackdropFilterWidget(),
        Utils.align: (BuildContext context) => AlignWidget(),
        Utils.animatedBuilder: (BuildContext context) => AnimatedBuilderWidget()
      },
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}