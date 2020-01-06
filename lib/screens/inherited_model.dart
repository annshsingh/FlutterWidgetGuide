import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class InheritedModelWidget extends StatefulWidget {
  @override
  _InheritedModelWidgetState createState() => _InheritedModelWidgetState();
}

class _InheritedModelWidgetState extends State<InheritedModelWidget> {
  Color _colorOne = Utils.getRandomColor();

  Color _colorTwo = Utils.getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'InheritedModel Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeScreen(code: Code.inheritedModelCode),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12),
        child: Column(
          children: <Widget>[
            Container(
              child: AncestorWidget(
                  _colorOne,
                  _colorTwo,
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DependentWidgetOne(),
                        DependentWidgetTwo()
                      ],
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: RaisedButton(
                      textColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).backgroundColor,
                      onPressed: () => setState(() {
                        _colorOne = Utils.getRandomColor();
                      }),
                      child: Text('RESET Child 1'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: RaisedButton(
                      textColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).backgroundColor,
                      onPressed: () => setState(() {
                        _colorTwo = Utils.getRandomColor();
                      }),
                      child: Text('RESET Child 2'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///Make a subclass for Parent widget
class AncestorWidget extends InheritedModel<String> {
  const AncestorWidget(this.colorOne, this.colorTwo, Widget child)
      : super(child: child);

  ///Add a field for your data
  final Color colorOne;
  final Color colorTwo;

  /// Typically the `inheritFrom` method is called from a model-specific
  /// static `of` method
  static AncestorWidget of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<AncestorWidget>(context, aspect: aspect);
  }

  ///Runs once for reach widget to determine if that widget should be rebuild
  ///Checks the aspect for a dependent widget and returns true if that
  ///widget should be rebuild depending on a certain condition.
  @override
  bool updateShouldNotifyDependent(
      AncestorWidget oldWidget, Set<String> aspects) {
    if (aspects.contains('one') && colorOne != oldWidget.colorOne) {
      print("Only widget one is rebuild");
      return true;
    }
    if (aspects.contains('two') && colorTwo != oldWidget.colorTwo) {
      print("Only widget two is rebuild");
      return true;
    }
    return false;
  }

  /// This decides whether dependent widgets should get rebuild if the
  /// inherited widget is replaced
  /// If [updateShouldNotify] returns true, then the
  /// inherited model's [updateShouldNotifyDependent] method is tested for
  /// each dependent and the set of aspect objects it depends on.
  /// The [updateShouldNotifyDependent] method must compare the set of aspect
  /// dependencies with the changes in the model itself.
  @override
  bool updateShouldNotify(AncestorWidget oldWidget) {
    print("First updateShouldNotify is checked");
    return colorOne != oldWidget.colorOne || colorTwo != oldWidget.colorTwo;
  }
}

///Make a subclass for Dependent widget
class DependentWidgetOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///Supplying an aspect to indicate which of the ancestor's field this widget cares about
    ///Widgets create a dependency on an [InheritedModel] with a static method
    final ancestor = AncestorWidget.of(context, 'one');
    return Container(
      color: ancestor.colorOne,
      height: 150,
      width: 200,
      child: Center(
        child: Text(
          "Dependent Child 1",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
    );
  }
}

///Make a subclass for Dependent widget
class DependentWidgetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///Supplying an aspect to indicate which of the ancestor's field this widget cares about
    ///Widgets create a dependency on an [InheritedModel] with a static method
    final ancestor = AncestorWidget.of(context, 'two');
    return Container(
      color: ancestor.colorTwo,
      height: 150,
      width: 200,
      child: Center(
        child: Text(
          "Dependent Child 2",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
    );
  }
}
