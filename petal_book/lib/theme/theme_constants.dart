import 'package:flutter/material.dart';

//Colors for theme
const Color lightPrimary = Color(0xfffcfcff);
const Color darkPrimary = Colors.black;
const Color lightAccent = Colors.blue;
const Color darkAccent = Colors.blueAccent;
const Color lightBG = Color(0xfffcfcff);
const Color darkBG = Colors.black;
const Color badgeColor = Colors.red;

TextTheme _basicTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontFamily: 'Roboto',
      fontSize: 22.0,
      color: Colors.black,
    ),
    title: base.title.copyWith(
      fontFamily: 'Merriweather',
      fontSize: 15.0,
      color: Colors.green,
    ),
    display1: base.headline.copyWith(
      fontFamily: 'Roboto',
      fontSize: 24.0,
      color: Colors.white,
    ),
    display2: base.headline.copyWith(
      fontFamily: 'Merriweather',
      fontSize: 22.0,
      color: Colors.grey,
    ),
    caption: base.caption.copyWith(
      color: const Color(0xFFCCC5AF),
    ),
    body1: base.body1.copyWith(
      color: const Color(0xFF807A6B),
    ),
  );
}

final ThemeData baseLightTheme = ThemeData.light();
final ThemeData baseDarkTheme = ThemeData.dark();

ThemeData lightTheme = baseLightTheme.copyWith(
  textTheme: _basicTextTheme(baseLightTheme.textTheme),
  primaryColor: const Color(0xffce107c),
  //primaryColor: Color(0xff4829b2),
  indicatorColor: const Color(0xFF807A6B),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  accentColor: const Color(0xFFFFF8E1),
  iconTheme: const IconThemeData(
    color: lightAccent,
    size: 50.0,
  ),
  buttonColor: Colors.white,
  backgroundColor: Colors.white,
  tabBarTheme: baseLightTheme.tabBarTheme.copyWith(
    labelColor: const Color(0xffce107c),
    unselectedLabelColor: Colors.grey,
  ),
  cursorColor: lightAccent,
  appBarTheme: const AppBarTheme(
    color: lightAccent,
    elevation: 0, 
  ),
);

ThemeData darkTheme = baseDarkTheme.copyWith(
  textTheme: _basicTextTheme(baseDarkTheme.textTheme),
  brightness: Brightness.dark,
  backgroundColor: darkBG,
  primaryColor: darkPrimary,
  accentColor: darkAccent,
  scaffoldBackgroundColor: darkBG,
  cursorColor: darkAccent,
  appBarTheme: AppBarTheme(
    elevation: 0,
    textTheme: TextTheme(
      title: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  ),
);
