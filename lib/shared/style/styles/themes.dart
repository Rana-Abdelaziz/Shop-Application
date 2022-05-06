import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var lightTheme = ThemeData(
  primarySwatch: Colors.lightBlue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.white,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.black, size: 30.0)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.lightBlue,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
);
var darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Color(0xff333739),
  appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Color(0xff333739),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff333739),
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.white, size: 30.0)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff333739),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.lightBlue,
      unselectedItemColor: Colors.grey),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0)),
);
