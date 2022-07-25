// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

// import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
//import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'dart:math';

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:c300drowningdetection/pages/testsplashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'provider/page_provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.MAIN_COLOR,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TestSplashScreen();
            } else {
              return MainLoginPage();
            }
          },
        ),
      ),
    );
  }
}




