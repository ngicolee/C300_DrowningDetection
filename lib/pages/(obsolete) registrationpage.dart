// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:c300drowningdetection/colorpalette.dart';
import 'package:c300drowningdetection/pages/(obsolete)%20loginpage.dart';
import 'package:c300drowningdetection/widgets/(obsolete)%20loginandregisterbackground.dart';
import 'package:c300drowningdetection/widgets/(obsolete)%20loginusrinput.dart';
import 'package:c300drowningdetection/widgets/(obsolete)%20registerbtn.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      BackgroundImage(image: 'assets/imgs/Background.jpg'),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width * 0.1,
              ),
              Stack(
                children: [
                  Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: CircleAvatar(
                        radius: size.width * 0.14,
                        backgroundColor: Colors.grey[400]?.withOpacity(
                          0.5,
                        ),
                        child: Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: size.width * 0.1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.08,
                    left: size.width * 0.58,
                    child: Container(
                      height: size.width * 0.1,
                      width: size.width * 0.1,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.arrow_upward_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.1,
              ),
              Column(
                children: [
                  UserInputField(
                      inputIcon: Icons.person,
                      inputField: 'Username',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next),
                  UserInputField(
                      inputIcon: Icons.email,
                      inputField: 'Email Address',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next),
                  UserInputField(
                      inputIcon: Icons.lock,
                      inputField: 'Password',
                      inputType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.next),
                  UserInputField(
                      inputIcon: Icons.lock,
                      inputField: 'Confirm Password',
                      inputType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done),
                  SizedBox(
                    height: 25,
                  ),
                  RegisterBtn(btnName: 'Register'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: bodyText),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Login',
                            style: bodyText.copyWith(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
