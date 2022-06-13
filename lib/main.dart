import 'package:c300drowningdetection/pages/forgotpwpage.dart';
import 'package:c300drowningdetection/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:c300drowningdetection/pages/splashpage.dart';
import 'package:c300drowningdetection/pages/welcomepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        duration: 4,
        goToPage: WelcomePage(),
      ),
      routes: {
        'Login': (context) => LoginPage(),
        'ForgotPassword': (context) => ForgotPwPage(),
      }
    ),
  );
}
// ignore: must_be_immutable




