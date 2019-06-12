import 'package:flutter_widget_guide/model/list_Item.dart';
import 'package:flutter_widget_guide/utils.dart';

class ListViewModel {
  List<ListItem> listItems;

  ListViewModel({this.listItems});

  getListItems() {
    return listItems = <ListItem>[
      ListItem(
          title: "${Utils.safeArea.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.safeAreaDescription}",
          url: "${Utils.safeAreaURL}",
          videoUrl: "${Utils.safeAreaVideoUrl}"),
      ListItem(
          title: "${Utils.expanded.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.expandedDescription}",
          url: "${Utils.expandedURL}",
          videoUrl: "${Utils.expandedVideoUrl}"),
      ListItem(
          title: "${Utils.wrap.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.wrapDescription}",
          url: "${Utils.wrapURL}",
          videoUrl: "${Utils.wrapVideoUrl}"),
      ListItem(
          title: "${Utils.animatedContainer.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.animatedContainerDescription}",
          url: "${Utils.animatedContainerURL}",
          videoUrl: "${Utils.animatedContainerVideoUrl}"),
      ListItem(
          title: "${Utils.opacity.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.opacityDescription}",
          url: "${Utils.opacityURL}",
          videoUrl: "${Utils.opacityVideoUrl}"),
      ListItem(
          title: "${Utils.futureBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.futureBuilderDescription}",
          url: "${Utils.futureBuilderURL}",
          videoUrl: "${Utils.futureBuilderVideoUrl}"),
      ListItem(
          title: "${Utils.fadeTransition.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.fadeTransitionDescription}",
          url: "${Utils.fadeTransitionURL}",
          videoUrl: "${Utils.fadeTransitionVideoUrl}"),
      ListItem(
          title:
              "${Utils.floatingActionButton.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.floatingActionButtonDescription}",
          url: "${Utils.floatingActionButtonURL}",
          videoUrl: "${Utils.fabVideoUrl}"),
      ListItem(
          title: "${Utils.pageView.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.pageViewDescription}",
          url: "${Utils.pageViewURL}",
          videoUrl: "${Utils.pageViewURL}"),
      ListItem(
          title: "${Utils.table.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.tableDescription}",
          url: "${Utils.tableURL}",
          videoUrl: "${Utils.tableVideoUrl}"),
      ListItem(
          title: "${Utils.sliverAppBar.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sliverAppBarDescription}",
          url: "${Utils.sliverAppBarURL}",
          videoUrl: "${Utils.sliverAppBarVideoUrl}"),
      ListItem(
          title: "${Utils.sliverList.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sliverListDescription}",
          url: "${Utils.sliverListURL}",
          videoUrl: "${Utils.sliverListVideoUrl}"),
      ListItem(
          title: "${Utils.sliverGrid.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sliverGridDescription}",
          url: "${Utils.sliverGridURL}",
          videoUrl: "${Utils.sliverGridVideoUrl}"),
      ListItem(
          title: "${Utils.fadeInImage.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.fadeInImageDescription}",
          url: "${Utils.fadeInImageURL}",
          videoUrl: "${Utils.fadeInImageVideoUrl}"),
      ListItem(
          title: "${Utils.streamBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.streamBuilderDescription}",
          url: "${Utils.streamBuilderURL}",
          videoUrl: "${Utils.streamBuilderVideoUrl}"),
      ListItem(
          title: "${Utils.inheritedModel.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.inheritedModelDescription}",
          url: "${Utils.inheritedModelURL}",
          videoUrl: "${Utils.inheritedModelVideoUrl}"),
      ListItem(
          title: "${Utils.clipRRect.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.clipRRectDescription}",
          url: "${Utils.clipRRectURL}",
          videoUrl: "${Utils.clipRrectVideoUrl}"),
      ListItem(
          title: "${Utils.hero.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.heroDescription}",
          url: "${Utils.heroURL}",
          videoUrl: "${Utils.heroVideoUrl}"),
      ListItem(
          title: "${Utils.customPaint.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.customPaintDescription}",
          url: "${Utils.customPaintURL}",
          videoUrl: "${Utils.customPaintVideoUrl}"),
      ListItem(
          title: "${Utils.tooltip.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.tooltipDescription}",
          url: "${Utils.tooltipURL}",
          videoUrl: "${Utils.toolTipVideoUrl}"),
      ListItem(
          title: "${Utils.fittedBox.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.fittedBoxDescription}",
          url: "${Utils.fittedBoxURL}",
          videoUrl: "${Utils.fittedBoxVideoUrl}"),
      ListItem(
          title: "${Utils.layoutBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.layoutBuilderDescription}",
          url: "${Utils.layoutBuilderURL}",
          videoUrl: "${Utils.layoutBuilderVideoUrl}"),
      ListItem(
          title: "${Utils.absorbPointer.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.absorbPointerDescription}",
          url: "${Utils.absorbPointerURL}",
          videoUrl: "${Utils.absorbPointerVideoUrl}"),
      ListItem(
          title: "${Utils.transform.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.transformDescription}",
          url: "${Utils.transformURL}",
          videoUrl: "${Utils.transformVideoUrl}"),
      ListItem(
          title: "${Utils.backDropFilter.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.backDropFilterDescription}",
          url: "${Utils.backDropFilterURL}",
          videoUrl: "${Utils.backdropVideoUrl}"),
      ListItem(
          title: "${Utils.align.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.alignDescription}",
          url: "${Utils.alignURL}",
          videoUrl: "${Utils.alignVideoUrl}"),
      ListItem(
          title: "${Utils.positioned.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.positionedDescription}",
          url: "${Utils.positionedURL}",
          videoUrl: "${Utils.positionedVideoUrl}"),
      ListItem(
          title: "${Utils.animatedBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.animatedBuilderDescription}",
          url: "${Utils.animatedBuilderURL}",
          videoUrl: "${Utils.animatedBuilderVideoUrl}"),
      ListItem(
          title: "${Utils.dismissible.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.dismissibleDescription}",
          url: "${Utils.dismissibleURL}",
          videoUrl: "${Utils.dismissibleVideoUrl}"),
      ListItem(
          title: "${Utils.sizedBox.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sizedBoxDescription}",
          url: "${Utils.sizedBoxURL}",
          videoUrl: "${Utils.sizedBoxVideoUrl}"),
      ListItem(
          title: "${Utils.valueListenableBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.valueListenableBuilderDescription}",
          url: "${Utils.valueListenableBuilderURL}",
          videoUrl: "${Utils.valueListenableBuilderVideoUrl}"),
      ListItem(
          title: "${Utils.draggable.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.draggableDescription}",
          url: "${Utils.draggableURL}",
          videoUrl: "${Utils.draggableVideoUrl}"),
      ListItem(
          title: "${Utils.animatedList.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.animatedListDescription}",
          url: "${Utils.animatedListURL}",
          videoUrl: "${Utils.animatedListVideoUrl}"),
      ListItem(
          title: "${Utils.flexible.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.flexibleDescription}",
          url: "${Utils.flexibleURL}",
          videoUrl: "${Utils.flexibleVideoUrl}"),
      ListItem(
          title: "${Utils.mediaQuery.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.mediaQueryDescription}",
          url: "${Utils.mediaQueryURL}",
          videoUrl: "${Utils.mediaqueryVideoUrl}"),
      ListItem(
          title: "${Utils.spacer.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.spacerDescription}",
          url: "${Utils.spacerURL}",
          videoUrl: "${Utils.spacerVideoUrl}"),
      ListItem(
          title: "${Utils.inheritedWidget.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.inheritedWidgetDescription}",
          url: "${Utils.inheritedWidgetURL}",
          videoUrl: "${Utils.inheritedWidgetVideoUrl}")
    ];
  }
}
