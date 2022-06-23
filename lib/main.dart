// ignore_for_file: prefer_const_constructors

import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:c300drowningdetection/pages/splashpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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




