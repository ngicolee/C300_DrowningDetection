// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:c300drowningdetection/colorpalette.dart';
import 'package:c300drowningdetection/pages/forgotpwpage.dart';
import 'package:c300drowningdetection/pages/registrationpage.dart';
import 'package:c300drowningdetection/widgets/loginandregisterbackground.dart';
import 'package:c300drowningdetection/widgets/loginwidgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(
        image: 'assets/imgs/LoginBackground.jpg',
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Flexible(
              child: Center(
                child: Text(
                  'Basic User Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UserInputField(
                    inputIcon: Icons.person_add,
                    inputField: 'Username',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next),
                PasswordInputField(
                    inputIcon: Icons.lock,
                    inputField: 'Password',
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPwPage())),
                  child: Text(
                    'Forgot Password',
                    style: bodyText,
                  ),
                ),
                SizedBox(height: 25),
                LoginBtn(btnName: 'Login'),
                SizedBox(height: 25),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(),
                ),
              ),
              child: Container(
                child: Text(
                  'Create New Account',
                  style: bodyText,
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]);
  }
}
