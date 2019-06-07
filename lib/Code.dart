class Code{

  ///Flex factor for 1st widget
  static const _flexFactor0 = 1;
  ///Flex factor for 2nd widget
  static const _flexFactor1 = 2;
  ///Flex factor for 3rd widget
  static const _flexFactor2 = 1;

  static const String safeAreaCode = '''
    class SafeAreaWidget extends StatefulWidget {
      @override
      _SafeAreaWidgetState createState() => _SafeAreaWidgetState();
    }
    
    class _SafeAreaWidgetState extends State<SafeAreaWidget> {
      ///Bool value to control the behaviour of SafeArea widget.
      bool _isEnabled = true;
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            top: _isEnabled,
            bottom: _isEnabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Text(
                    "This widget is below safe area. If you remove the SafeArea "
                        "widget then this text will be behind the notch.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
    
                ///Press this button to toggle the value of _isEnabled variable
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.indigo,
                  onPressed: () => setState(() {
                        _isEnabled == true ? _isEnabled = false : _isEnabled = true;
                      }),
                  child: Text(_isEnabled ? "Disable SafeArea" : "Enable SafeArea"),
                ),
    
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Text(
                    "This widget is above safe area",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } ''';


  static const String expandedCode = ''' 
    class ExpandedWidget extends StatefulWidget {
      @override
      _ExpandedWidgetState createState() => _ExpandedWidgetState();
    }
    
    class _ExpandedWidgetState extends State<ExpandedWidget> {
      ///Flex factor for 1st widget
      int _flexFactor0 = 1;
      ///Flex factor for 2nd widget
      int _flexFactor1 = 2;
      ///Flex factor for 3rd widget
      int _flexFactor2 = 1;
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Container(
              child: Center(
                child: Text(
                  'Expanded Widget',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: Utils.ubuntuRegularFont),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Color(0xFF323232),
                ),
                onPressed: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            titlePadding: EdgeInsets.only(top: 28),
                            title: Center(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Utils.ubuntuRegularFont),
                                  ),
                                  FlatButton(
                                    onPressed: () =>
                                        Utils.launchURL(Utils.expandedSourceURL),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    // makes highlight invisible too
                                    child: Text('(Source Code)',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: Utils.crimsonRegularFont,
                                            color: Colors.cyan)),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(0),
                              child: SvgPicture.asset(
                                Utils.expanded_img,
                                semanticsLabel: "Expanded Description",
                              ),
                            ),
                          ),
                    ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  color: Color(0xFFe0e0e0),
                  child: Row(
                    children: <Widget>[
                      ///First flexible widget
                      Expanded(
                        flex: _flexFactor0,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: GestureDetector(
                            child: Container(
                              child: Center(
                                child: Text(
                                  '$_flexFactor0',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              color: const Color(0xFF2196f3),
                              width: 48.0,
                              height: 48.0,
                            ),
                            onTap: () => setState(() {
                                  _flexFactor0++;
                                }),
                          ),
                        ),
                      ),
                      ///Second flexible widget
                      Expanded(
                        flex: _flexFactor1,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: GestureDetector(
                            child: Container(
                              child: Center(
                                child: Text(
                                  '$_flexFactor1',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              color: const Color(0xFF673ab7),
                              width: 48.0,
                              height: 48.0,
                            ),
                            onTap: () => setState(() {
                                  _flexFactor1++;
                                }),
                          ),
                        ),
                      ),
                      ///Third flexible widget
                      Expanded(
                        flex: _flexFactor2,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: GestureDetector(
                            child: Container(
                              child: Center(
                                child: Text(
                                  '$_flexFactor2',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              color: const Color(0xFF009688),
                              width: 48.0,
                              height: 48.0,
                            ),
                            onTap: () => setState(() {
                                  _flexFactor2++;
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///Click on this button to RESET the values of flex values
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () => setState(() {
                          _flexFactor0 = 1;
                          _flexFactor1 = 2;
                          _flexFactor2 = 1;
                        }),
                    child: Text('RESET'),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }''';

  static const String wrapCode = '''
    class WrapWidget extends StatefulWidget {
        @override
        _WrapWidgetState createState() => _WrapWidgetState();
    }
      
    class _WrapWidgetState extends State<WrapWidget> {
      
        BuildContext context; //global context
      
        @override
        Widget build(BuildContext context) {
          this.context = context;
          return Scaffold(
            appBar: AppBar(
              title: Container(
                child: Center(
                  child: Text(
                    'Wrap Widget',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Utils.ubuntuRegularFont),
                  ),
                ),
                margin: EdgeInsets.only(right: 48),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Without Wrap widget',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Utils.ubuntuRegularFont),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                              child: Text(
                                'Here we observe that the layout is overflowing 
                                 to the right which results in a broken widget',
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: Utils.ubuntuRegularFont),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
      
                      ///This will create an overflow error
                      Row(
                        children: <Widget>[
                          chipDesign("Food", Color(0xFF4fc3f7)),
                          chipDesign("Lifestyle", Color(0xFFffb74d)),
                          chipDesign("Health", Color(0xFFff8a65)),
                          chipDesign("Sports", Color(0xFF9575cd)),
                          chipDesign("Nature", Color(0xFF4db6ac)),
                          chipDesign("Fashion", Color(0xFFf06292)),
                          chipDesign("Heritage", Color(0xFFa1887f)),
                          chipDesign("City Life", Color(0xFF90a4ae)),
                          chipDesign("Entertainment", Color(0xFFba68c8)),
                        ],
                      ),
                    ],
                  ),
      
                  divider(context),
      
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'With Wrap widget',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Utils.ubuntuRegularFont),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                              child: Text(
                                'Here we observe that chips are contained inside a Wrap '
                                'widget. It adjusts all the children according to the space'
                                'available and automatically wraps to the next line',
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: Utils.ubuntuRegularFont),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
      
                      ///This will handle itself to get rid of the overflow error
                      Wrap(
                        spacing: 0.0, // gap between adjacent chips
                        runSpacing: 0.0, // gap between lines
                        children: <Widget>[
                          chipDesign("Food", Color(0xFF4fc3f7)),
                          chipDesign("Lifestyle", Color(0xFFffb74d)),
                          chipDesign("Health", Color(0xFFff8a65)),
                          chipDesign("Sports", Color(0xFF9575cd)),
                          chipDesign("Nature", Color(0xFF4db6ac)),
                          chipDesign("Fashion", Color(0xFFf06292)),
                          chipDesign("Heritage", Color(0xFFa1887f)),
                          chipDesign("City Life", Color(0xFF90a4ae)),
                          chipDesign("Entertainment", Color(0xFFba68c8)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }
      
      
    ///Common method to design a chip with different properties
    ///like label and background color
    Widget chipDesign(String label, Color color) => Container(
          child: Chip(
            label: Text(
                label,
                style: TextStyle(
                    color: Colors.white, fontFamily: Utils.ubuntuRegularFont),
              ),
              backgroundColor: color,
              elevation: 4,
              shadowColor: Colors.grey[50],
              padding: EdgeInsets.all(4),
            ),
            margin: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
          );
      
      ///Method to create a divider with added margin
    Container divider(BuildContext context) => Container(
        child: Divider(),
        margin: EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 28),
    );
   ''';

  static const String animatedContainerCode = ''' 
    class AnimatedContainerWidget extends StatefulWidget {
      @override
      _AnimatedContainerWidgetState createState() =>
          _AnimatedContainerWidgetState();
    }
    
    class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
      Alignment _alignment = Alignment.center;
      double _animatedHeight = 200.0;
      double _animatedWidth = 400.0;
      double _iconHeight = 180.0;
      double _iconWidth = 180.0;
      Color _animatedColor = Colors.red;
      bool _isAnimated = false;
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Container(
              child: Center(
                child: Text(
                  'Animated Container Widget',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: Utils.ubuntuRegularFont),
                ),
              ),
              margin: EdgeInsets.only(right: 48),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 24),
              child: Center(
                ///Animated Container to change the background color with
                ///an animation
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: _animatedWidth,
                  height: _animatedHeight,
                  color: _animatedColor,
                  curve: Curves.fastOutSlowIn,
                  ///Animated container that changes the alignment of
                  ///FlutterLogo with an animation
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    alignment: _alignment,
                    ///Animated Container to change the dimentions of the
                    ///FlutterLogo with an animation
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      height: _iconHeight,
                      width: _iconWidth,
                      child: FlutterLogo(
                        colors: Colors.amber,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.green,
            onPressed: () => setState(() {
                  /// Condition to toggle the _isAnimated bool variable
                  _animatedWidth == 400.0
                      ? _isAnimated = true
                      : _isAnimated = false;
                  /// Condition to change the alignment of Flutter logo
                  _isAnimated
                      ? _alignment = Alignment.topCenter
                      : _alignment = Alignment.center;
                  /// Condition to change the width of the background container
                  _isAnimated ? _animatedWidth = 200.0 : _animatedWidth = 400.0;
                  /// Condition to change the height of background container
                  /// MediaQuery.of(context).size.height - 200 is done to keep
                  /// height always above the FAB
                  _isAnimated
                      ? _animatedHeight = MediaQuery.of(context).size.height - 200
                      : _animatedHeight = 200.0;
                  /// Condition to change the background color
                  _isAnimated
                      ? _animatedColor = Colors.lightBlue
                      : _animatedColor = Colors.red;
                  /// Condition to change the width of FlutterLogo
                  _isAnimated ? _iconWidth = 100.0 : _iconWidth = 180.0;
                  /// Condition to change the height of FlutterLogo
                  _isAnimated ? _iconHeight = 100.0 : _iconHeight = 180.0;
                }),
            icon: Icon(
              Icons.movie_filter,
              color: Colors.white,
            ),
            label: Text(
              "Animate",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }''';

}