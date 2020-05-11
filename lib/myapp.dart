import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/screens/WebViewWidget.dart';
import 'package:flutter_widget_guide/screens/absorb_pointer.dart';
import 'package:flutter_widget_guide/screens/alert_dialog_widget.dart';
import 'package:flutter_widget_guide/screens/align.dart';
import 'package:flutter_widget_guide/screens/animated_builder.dart';
import 'package:flutter_widget_guide/screens/animated_container.dart';
import 'package:flutter_widget_guide/screens/animated_crossfade_widget.dart';
import 'package:flutter_widget_guide/screens/animated_icon.dart';
import 'package:flutter_widget_guide/screens/animated_list.dart';
import 'package:flutter_widget_guide/screens/animated_opacity.dart';
import 'package:flutter_widget_guide/screens/animated_padding.dart';
import 'package:flutter_widget_guide/screens/animated_positioned.dart';
import 'package:flutter_widget_guide/screens/animated_switcher.dart';
import 'package:flutter_widget_guide/screens/aspect_ratio.dart';
import 'package:flutter_widget_guide/screens/backdrop_filter.dart';
import 'package:flutter_widget_guide/screens/builder.dart';
import 'package:flutter_widget_guide/screens/circularProgressIndicator.dart';
import 'package:flutter_widget_guide/screens/clip_path.dart';
import 'package:flutter_widget_guide/screens/clip_r_rect.dart';
import 'package:flutter_widget_guide/screens/color_filtered.dart';
import 'package:flutter_widget_guide/screens/constrained_box.dart';
import 'package:flutter_widget_guide/screens/container.dart';
import 'package:flutter_widget_guide/screens/cupertino_action_sheet.dart';
import 'package:flutter_widget_guide/screens/custom_paint.dart';
import 'package:flutter_widget_guide/screens/datatable_widget.dart';
import 'package:flutter_widget_guide/screens/dismissible.dart';
import 'package:flutter_widget_guide/screens/draggable.dart';
import 'package:flutter_widget_guide/screens/draggable_scrollable_sheet.dart';
import 'package:flutter_widget_guide/screens/expanded.dart';
import 'package:flutter_widget_guide/screens/fade_in_image.dart';
import 'package:flutter_widget_guide/screens/fade_transition.dart';
import 'package:flutter_widget_guide/screens/fitted_box.dart';
import 'package:flutter_widget_guide/screens/flexible.dart';
import 'package:flutter_widget_guide/screens/floating_action_button.dart';
import 'package:flutter_widget_guide/screens/fractionally_sizedbox.dart';
import 'package:flutter_widget_guide/screens/future_builder.dart';
import 'package:flutter_widget_guide/screens/hero.dart';
import 'package:flutter_widget_guide/screens/hero2.dart';
import 'package:flutter_widget_guide/screens/home_page.dart';
import 'package:flutter_widget_guide/screens/image_widget.dart';
import 'package:flutter_widget_guide/screens/inherited_model.dart';
import 'package:flutter_widget_guide/screens/inherited_widget.dart';
import 'package:flutter_widget_guide/screens/layout_builder.dart';
import 'package:flutter_widget_guide/screens/limited_box.dart';
import 'package:flutter_widget_guide/screens/list_tile.dart';
import 'package:flutter_widget_guide/screens/list_view.dart';
import 'package:flutter_widget_guide/screens/media_query.dart';
import 'package:flutter_widget_guide/screens/notification_listener.dart';
import 'package:flutter_widget_guide/screens/opacity.dart';
import 'package:flutter_widget_guide/screens/page_view.dart';
import 'package:flutter_widget_guide/screens/placeholder.dart';
import 'package:flutter_widget_guide/screens/positioned.dart';
import 'package:flutter_widget_guide/screens/reorderable_listiew.dart';
import 'package:flutter_widget_guide/screens/rich_text.dart';
import 'package:flutter_widget_guide/screens/safe_area.dart';
import 'package:flutter_widget_guide/screens/selectable_text.dart';
import 'package:flutter_widget_guide/screens/semantics_widget.dart';
import 'package:flutter_widget_guide/screens/sized_box.dart';
import 'package:flutter_widget_guide/screens/slider_widget.dart';
import 'package:flutter_widget_guide/screens/sliver_app_bar.dart';
import 'package:flutter_widget_guide/screens/sliver_grid.dart';
import 'package:flutter_widget_guide/screens/sliver_list.dart';
import 'package:flutter_widget_guide/screens/spacer.dart';
import 'package:flutter_widget_guide/screens/stack_widget.dart';
import 'package:flutter_widget_guide/screens/stream_builder.dart';
import 'package:flutter_widget_guide/screens/table.dart';
import 'package:flutter_widget_guide/screens/tabs_widget.dart';
import 'package:flutter_widget_guide/screens/toggle_buttons.dart';
import 'package:flutter_widget_guide/screens/tooltip.dart';
import 'package:flutter_widget_guide/screens/transform.dart';
import 'package:flutter_widget_guide/screens/tween_animation_builder.dart';
import 'package:flutter_widget_guide/screens/value_listenable_builder.dart';
import 'package:flutter_widget_guide/screens/wrap.dart';
import 'package:flutter_widget_guide/settings.dart';
import 'package:flutter_widget_guide/themes.dart';
import 'package:flutter_widget_guide/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'VideoView.dart';
import 'screens/drawer_widget.dart';
import 'screens/indexed_stack.dart';
import 'screens/listwheelscrollview_widget.dart';
import 'screens/shadermask_widget.dart';
import 'screens/snackbar_widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Here we are asynchronously passing an instance of SharedPreferences
    /// to our Settings ChangeNotifier class and that in turn helps us
    /// determine the basic app settings to be applied whenever the app is
    /// launched.
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<Settings>.value(
          value: Settings(snapshot.data),
          child: _MyApp(),
        );
      },
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Utils.appName,
      theme:
          Provider.of<Settings>(context).isDarkMode ? kDarkTheme : kLightTheme,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      //all the app routes are listed here
      routes: <String, WidgetBuilder>{
        Utils.codeRoute: (BuildContext context) => CodeScreen(code: ""),
        Utils.videoView: (BuildContext context) => VideoView(
              videoUrl: "",
              title: "",
            ),
        Utils.webView: (BuildContext context) => WebViewWidget(url: ""),
        Utils.homeRoute: (BuildContext context) => HomePage(),
        Utils.safeArea: (BuildContext context) => SafeAreaWidget(),
        Utils.expanded: (BuildContext context) => ExpandedWidget(),
        Utils.wrap: (BuildContext context) => WrapWidget(),
        Utils.animatedContainer: (BuildContext context) =>
            AnimatedContainerWidget(),
        Utils.opacity: (BuildContext context) => OpacityWidget(),
        Utils.futureBuilder: (BuildContext context) => FutureBuilderWidget(),
        Utils.fadeTransition: (BuildContext context) => FadeTransitionWidget(),
        Utils.floatingActionButton: (BuildContext context) =>
            FloatingActionButtonWidget(),
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
        Utils.hero2: (BuildContext context) => Hero2Widget(),
        Utils.customPaint: (BuildContext context) => CustomPaintWidget(),
        Utils.tooltip: (BuildContext context) => TooltipWidget(),
        Utils.fittedBox: (BuildContext context) => FittedBoxWidget(),
        Utils.layoutBuilder: (BuildContext context) => LayoutBuilderWidget(),
        Utils.absorbPointer: (BuildContext context) => AbsorbPointerWidget(),
        Utils.transform: (BuildContext context) => TransformWidget(),
        Utils.backDropFilter: (BuildContext context) => BackdropFilterWidget(),
        Utils.align: (BuildContext context) => AlignWidget(),
        Utils.positioned: (BuildContext context) => PositionedWidget(),
        Utils.animatedBuilder: (BuildContext context) =>
            AnimatedBuilderWidget(),
        Utils.dismissible: (BuildContext context) => DismissibleWidget(),
        Utils.sizedBox: (BuildContext context) => SizedBoxWidget(),
        Utils.valueListenableBuilder: (BuildContext context) =>
            ValueListenableBuilderWidget(),
        Utils.draggable: (BuildContext context) => DraggableWidget(),
        Utils.animatedList: (BuildContext context) => AnimatedListWidget(),
        Utils.flexible: (BuildContext context) => FlexibleWidget(),
        Utils.mediaQuery: (BuildContext context) => MediaQueryWidget(),
        Utils.spacer: (BuildContext context) => SpacerWidget(),
        Utils.inheritedWidget: (BuildContext context) => InheritedWidgett(),
        Utils.animatedIcon: (BuildContext context) => AnimatedIconWidget(),
        Utils.aspectRatio: (BuildContext context) => AspectRatioWidget(),
        Utils.limitedBox: (BuildContext context) => LimitedBoxWidget(),
        Utils.placeholder: (BuildContext context) => PlaceholderWidget(),
        Utils.richText: (BuildContext context) => RichTextWidget(),
        Utils.reorderableListView: (BuildContext context) =>
            ReorderableListViewWidget(),
        Utils.animatedSwitcher: (BuildContext context) =>
            AnimatedSwitcherWidget(),
        Utils.animatedPositioned: (BuildContext context) =>
            AnimatedPositionedWidget(),
        Utils.animatedPadding: (BuildContext context) =>
            AnimatedPaddingWidget(),
        Utils.indexedStack: (BuildContext context) => IndexedStackWidget(),
        Utils.semantics: (BuildContext context) => SemanticsWidget(),
        Utils.constrainedBox: (BuildContext context) => ConstrainedBoxWidget(),
        Utils.stack: (BuildContext context) => StackWidget(),
        Utils.animatedOpacity: (BuildContext context) =>
            AnimatedOpacityWidget(),
        Utils.fractionallySizedBox: (BuildContext context) =>
            FractionallySizedBoxWidget(),
        Utils.listView: (BuildContext context) => ListViewWidget(),
        Utils.listTile: (BuildContext context) => ListTileWidget(),
        Utils.container: (BuildContext context) => ContainerWidget(),
        Utils.selectableText: (BuildContext context) => SelectableTextWidget(),
        Utils.dataTable: (BuildContext context) => DataTableWidget(),
        Utils.slider: (BuildContext context) => SliderWidget(),
        Utils.alertDialog: (BuildContext context) => AlertDialogWidget(),
        Utils.animatedCrossFade: (BuildContext context) =>
            AnimatedCrossFadeWidget(),
        Utils.draggableScrollableSheet: (BuildContext context) =>
            DraggableScrollableSheetWidget(),
        Utils.colorFiltered: (BuildContext context) => ColorFilteredWidget(),
        Utils.toggleButtons: (BuildContext context) => ToggleButtonsWidget(),
        Utils.cupertinoActionSheet: (BuildContext context) => CupertinoActionSheetWidget(),
        Utils.tweenAnimationBuilder: (BuildContext context) => TweenAnimationBuilderWidget(),
        Utils.image: (BuildContext context) => ImageWidget(),
        Utils.tabs: (BuildContext context) => TabsWidget(),
        Utils.drawer: (BuildContext context) => DrawerWidget(),
        Utils.snackBar: (BuildContext context) => SnackBarWidget(),
        Utils.listWheelScrollView: (BuildContext context) => ListWheelScrollViewWidget(),
        Utils.shaderMask: (BuildContext context) => ShaderMaskWidget(),
        Utils.notificationListener: (BuildContext context) => NotificationListenerWidget(),
        Utils.builder: (BuildContext context) => BuilderWidget(),
        Utils.clipPath: (BuildContext context) => ClipPathWidget(),
        Utils.circularProgressIndicator: (BuildContext context) => CircularProgressIndicatorWidget(),
      },
    );
  }
}
