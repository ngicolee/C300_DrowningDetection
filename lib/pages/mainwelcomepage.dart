// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:c300drowningdetection/pages/mainregistrationpage.dart';
import 'package:flutter/material.dart';

class MainWelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/imgs/PoolImage.jpg"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 25,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "The key to safety is in your hands",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 45,
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: AppColors.MAIN_COLOR,
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    // Page Route would be changed after completion of 'Pool Locations' pages
                    builder: (ctx) => MainRegistrationPage(),
                  ),
                );
                  },
                  child: Text(
                    "Register Here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Already have an Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          // Page Route would be changed after completion of 'Pool Locations' pages
                          builder: (ctx) => MainLoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Login Here!",
                      style: TextStyle(color: AppColors.MAIN_COLOR),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
