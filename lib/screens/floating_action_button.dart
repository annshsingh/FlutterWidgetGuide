import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  @override
  _FloatingActionButtonWidgetState createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  bool _isMini = false;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title:Text(
              'FAB Widget',
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
                builder: (context) => CodeScreen(code: Code.fabCode),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88.0),
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 24),
              child: Text(
                'Select Fab Size',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _OptionItem(false, _isMini, _onSizeChange, 'Normal'),

                _OptionItem(true, _isMini, _onSizeChange, 'Mini'),
              ],
            ),
          ),

          divider(context),

          Center(
            child: Container(
              margin: EdgeInsets.only(top: 24),
              child: Text(
                'Select Fab Position',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
            ),
          ),

          ///Container containing all the Radio buttons
          Container(
            margin: EdgeInsets.all(18),
            child: Wrap(
              children: <Widget>[
                _OptionItem(FloatingActionButtonLocation.centerDocked, _fabLocation, _onLocationChanged, 'Center (Docked)'),

                _OptionItem(FloatingActionButtonLocation.endDocked, _fabLocation, _onLocationChanged, 'End (Docked)'),

                _OptionItem(FloatingActionButtonLocation.centerFloat, _fabLocation, _onLocationChanged, 'Center (Float)'),

                _OptionItem(FloatingActionButtonLocation.endFloat, _fabLocation, _onLocationChanged, 'End (Float)'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("You clicked on the FAB"))),
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        elevation: 2.0,
        mini: _isMini,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: _fabLocation,
    );
  }

  ///method called whenever a radio button is clicked on to change position
  _onLocationChanged(FloatingActionButtonLocation value) => setState(() {
    _fabLocation = value;
  });

  ///method called whenever you want to change size
  _onSizeChange(bool value) => setState(() {
    _isMini = value;
  });

}

/// Class to create an option for the user to select for any <T> type.
/// Value -> The value that the radio button will set when it is clicked
/// Group value -> A value common to a group of radio buttons that is related to the
/// kind of values that each group member can set eg a boolean value or a
/// FloatingActionButtonLocation value etc.
/// onChanged -> the method that is to be called when clicked on a radio button
///
/// When the Group value and Value of a Radio button is same, that radio button
/// is marked as Selected
class _OptionItem<T> extends StatelessWidget {
  const _OptionItem(this.value, this.groupValue, this.onChanged, this.title);

  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<T>(
            value: value,
            groupValue: groupValue,
            activeColor: Colors.lightBlue,
            onChanged: onChanged
        ),
        GestureDetector(
          onTap: () {
            onChanged(value);
          },
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0, fontFamily: Utils.ubuntuRegularFont),
          ),
        ),
      ],
    );
  }
}

Container divider(BuildContext context) => Container(
  child: Divider(),
  margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
);


