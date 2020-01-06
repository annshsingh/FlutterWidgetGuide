import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/Code.dart';
import 'package:flutter_widget_guide/CodeScreen.dart';
import 'package:flutter_widget_guide/utils.dart';

class ToggleButtonsWidget extends StatefulWidget {
  @override
  _ToggleButtonsWidgetState createState() => _ToggleButtonsWidgetState();
}

class _ToggleButtonsWidgetState extends State<ToggleButtonsWidget> {
  var _fontWeight = FontWeight.normal;
  var _fontStyle = FontStyle.normal;
  var _textAlign = TextAlign.left;

  /// To manage selection states of 1st toggle buttons group
  List<bool> _selections1 = List.generate(2, (_) => false);

  /// To manage selection states of 2nd toggle buttons group
  List<bool> _selections2 = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ToggleButtons Widget',
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
                builder: (context) =>
                    CodeScreen(code: Code.toggleButtonsWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontWeight: _fontWeight,
                  fontStyle: _fontStyle,
                ),
                textAlign: _textAlign,
                maxLines: 3,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[200], width: 1.0),
                  ),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey[400]),
                  hintText: 'Type something here...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                cursorColor: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                /// First group of ToggleButtons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleButtons(
                    selectedColor: Colors.blue,
                    selectedBorderColor: Colors.blue[200],
                    children: <Widget>[
                      Icon(Icons.format_bold),
                      Icon(Icons.format_italic)
                    ],

                    /// To manage the selection states of options
                    isSelected: _selections1,
                    onPressed: (int index) {
                      setState(() {
                        /// Set true/False to manage selection states
                        _selections1[index] = !_selections1[index];

                        /// Controlling what happens when the Buttons
                        /// are selected based on the the index
                        if (index == 0) {
                          _fontWeight = _fontWeight == FontWeight.normal
                              ? FontWeight.bold
                              : FontWeight.normal;
                        } else if (index == 1) {
                          _fontStyle = _fontStyle == FontStyle.normal
                              ? FontStyle.italic
                              : FontStyle.normal;
                        }
                      });
                    },
                  ),
                ),

                /// Second group of ToggleButtons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleButtons(
                    selectedColor: Colors.blue,
                    selectedBorderColor: Colors.blue[200],
                    children: <Widget>[
                      Icon(Icons.format_align_center),
                      Icon(Icons.format_align_left),
                      Icon(Icons.format_align_right),
                    ],
                    isSelected: _selections2,
                    onPressed: (int index) {
                      setState(() {
                        if (index == 0) {
                          _selections2[0] = !_selections2[0];
                          _selections2[1] = false;
                          _selections2[2] = false;
                          _textAlign = _selections2[0]
                              ? TextAlign.center
                              : TextAlign.left;
                        } else if (index == 1) {
                          _selections2[0] = false;
                          _selections2[1] = !_selections2[1];
                          _selections2[2] = false;
                          _textAlign =
                              _selections2[1] ? TextAlign.left : TextAlign.left;
                        } else if (index == 2) {
                          _selections2[0] = false;
                          _selections2[1] = false;
                          _selections2[2] = !_selections2[2];
                          _textAlign = _selections2[2]
                              ? TextAlign.right
                              : TextAlign.left;
                        }
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
