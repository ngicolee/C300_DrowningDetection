// ignore_for_file: prefer_const_constructors

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:flutter/material.dart';

class SampleVideo1 extends StatelessWidget {
  const SampleVideo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sample Video 1",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                // Page Route would be changed after completion of 'Detection System' pages
                builder: (ctx) => MainHomePage(),
              ),
            );
          },
        ),
      ),
      backgroundColor: AppColors.MAIN_COLOR,
    );
  }
}
