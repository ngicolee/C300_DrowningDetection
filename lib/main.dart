// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:c300drowningdetection/pages/splashpage.dart';

import 'pages/mainloginpage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        duration: 4,
        goToPage: MainLoginPage(),
      ),
    ),
  );
}
// ignore: must_be_immutable




