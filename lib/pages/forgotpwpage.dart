// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:c300drowningdetection/colorpalette.dart';
import 'package:c300drowningdetection/widgets/forgotusrbtn.dart';
import 'package:c300drowningdetection/widgets/loginandregisterbackground.dart';
import 'package:c300drowningdetection/widgets/loginusrinput.dart';
import 'package:flutter/material.dart';

class ForgotPwPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return Stack(children: [
      BackgroundImage(
        image: 'assets/imgs/LoginBackground.jpg',
      ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text('Forgot Password', style: bodyText),
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Container(
                      width: size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                              'Enter an Existing Username',
                              style: bodyText),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserInputField(
                        inputIcon: Icons.person,
                        inputField: 'Username',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ForgotUsrBtn(btnName: 'Submit'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
