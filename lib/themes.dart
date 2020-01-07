import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Ref: https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/gallery/themes.dart

final kLightTheme = _buildLightTheme();
final kDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = Colors.white;
  const Color secondaryColor = Colors.white;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.white,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xFF1E88E5),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    dividerColor: Colors.black12,
    scaffoldBackgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),

    ///For Cupertino elements in Light theme
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.light
    ),

    ///For tooltip
    brightness: Brightness.light,
    backgroundColor: Colors.black87,
    primaryTextTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
    ),

    ///For slider label
    accentTextTheme: TextTheme(
      body2: TextStyle(color: Colors.white, backgroundColor: Colors.lightBlue),
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Colors.black;
  const Color secondaryColor = Colors.black87;
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    accentColorBrightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: Colors.black,
    primaryColorLight: secondaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    dividerColor: Colors.grey,
    toggleableActiveColor: const Color(0xFF6997DF),
    accentColor: secondaryColor,
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),

    ///For tooltip
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
    primaryTextTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
    ),

    ///For slider label
    accentTextTheme: TextTheme(
      body2: TextStyle(color: Colors.white, backgroundColor: Colors.lightBlue),
    ),

    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: primaryColor,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}
