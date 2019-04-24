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
          url: "${Utils.safeAreaURL}"),
      ListItem(
          title: "${Utils.expanded.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.expandedDescription}",
          url: "${Utils.expandedURL}"),
      ListItem(
          title: "${Utils.wrap.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.wrapDescription}",
          url: "${Utils.wrapURL}"),
      ListItem(
          title: "${Utils.animatedContainer.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.animatedContainerDescription}",
          url: "${Utils.animatedContainerURL}"),
      ListItem(
          title: "${Utils.opacity.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.opacityDescription}",
          url: "${Utils.opacityURL}"),
      ListItem(
          title: "${Utils.futureBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.futureBuilderDescription}",
          url: "${Utils.futureBuilderURL}"),
      ListItem(
          title: "${Utils.fadeTransition.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.fadeTransitionDescription}",
          url: "${Utils.fadeTransitionURL}"),
      ListItem(
          title:
              "${Utils.floatingActionButton.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.floatingActionButtonDescription}",
          url: "${Utils.floatingActionButtonURL}"),
      ListItem(
          title: "${Utils.pageView.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.pageViewDescription}",
          url: "${Utils.pageViewURL}"),
      ListItem(
          title: "${Utils.table.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.tableDescription}",
          url: "${Utils.tableURL}"),
      ListItem(
          title: "${Utils.sliverAppBar.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sliverAppBarDescription}",
          url: "${Utils.sliverAppBarURL}"),
      ListItem(
          title: "${Utils.sliverList.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sliverListDescription}",
          url: "${Utils.sliverListURL}"),
      ListItem(
          title: "${Utils.sliverGrid.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sliverGridDescription}",
          url: "${Utils.sliverGridURL}"),
      ListItem(
          title: "${Utils.fadeInImage.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.fadeInImageDescription}",
          url: "${Utils.fadeInImageURL}"),
      ListItem(
          title: "${Utils.streamBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.streamBuilderDescription}",
          url: "${Utils.streamBuilderURL}"),
      ListItem(
          title: "${Utils.inheritedModel.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.inheritedModelDescription}",
          url: "${Utils.inheritedModelURL}"),
      ListItem(
          title: "${Utils.clipRRect.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.clipRRectDescription}",
          url: "${Utils.clipRRectURL}"),
      ListItem(
          title: "${Utils.hero.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.heroDescription}",
          url: "${Utils.heroURL}"),
      ListItem(
          title: "${Utils.customPaint.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.customPaintDescription}",
          url: "${Utils.customPaintURL}"),
      ListItem(
          title: "${Utils.tooltip.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.tooltipDescription}",
          url: "${Utils.tooltipURL}"),
      ListItem(
          title: "${Utils.fittedBox.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.fittedBoxDescription}",
          url: "${Utils.fittedBoxURL}"),
      ListItem(
          title: "${Utils.layoutBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.layoutBuilderDescription}",
          url: "${Utils.layoutBuilderURL}"),
      ListItem(
          title: "${Utils.absorbPointer.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.absorbPointerDescription}",
          url: "${Utils.absorbPointerURL}"),
      ListItem(
          title: "${Utils.transform.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.transformDescription}",
          url: "${Utils.transformURL}"),
      ListItem(
          title: "${Utils.backDropFilter.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.backDropFilterDescription}",
          url: "${Utils.backDropFilterURL}"),
      ListItem(
          title: "${Utils.align.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.alignDescription}",
          url: "${Utils.alignURL}"),
      ListItem(
          title: "${Utils.positioned.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.positionedDescription}",
          url: "${Utils.positionedURL}"),
      ListItem(
          title: "${Utils.animatedBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.animatedBuilderDescription}",
          url: "${Utils.animatedBuilderURL}"),
      ListItem(
          title: "${Utils.dismissible.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.dismissibleDescription}",
          url: "${Utils.dismissibleURL}"),
      ListItem(
          title: "${Utils.sizedBox.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.sizedBoxDescription}",
          url: "${Utils.sizedBoxURL}"),
      ListItem(
          title: "${Utils.valueListenableBuilder.replaceAll(new RegExp(r'/'), '')}",
          description: "${Utils.valueListenableBuilderDescription}",
          url: "${Utils.valueListenableBuilderURL}")
    ];
  }
}
