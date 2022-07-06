// ignore_for_file: prefer_const_constructors, file_names

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  // ignore: use_key_in_widget_constructors
  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => goToPage),
      );
    });
    return Scaffold(
      body: Container(
        child: Icon(Icons.pool_sharp, color: Colors.white, size: 200),
        color: AppColors.MAIN_COLOR,
        alignment: Alignment.center,
      ), 
    );
  }
}
