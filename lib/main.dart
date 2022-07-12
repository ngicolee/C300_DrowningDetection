// ignore_for_file: prefer_const_constructors

// import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
//import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: MainWelcomePage(),//SelectedLocationPage(),
    ),
  );
}


// ignore: must_be_immutable




