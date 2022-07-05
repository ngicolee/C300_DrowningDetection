// ignore_for_file: prefer_const_constructors

// import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: MainWelcomePage(),
    ),
  );
}


// ignore: must_be_immutable




