// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_print

import 'package:c300drowningdetection/colorpalette.dart';
import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:flutter/material.dart';

class MainRegistrationPage extends StatefulWidget {
  @override
  State<MainRegistrationPage> createState() => _MainRegistrationPageState();
}

final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();
String emailRE =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
String phoneRE = r'(9|8){1}[0-9]{7}$';

RegExp emailRegExp = RegExp(emailRE);
RegExp phoneRegExp = RegExp(phoneRE);

bool obscureText = true;

class _MainRegistrationPageState extends State<MainRegistrationPage> {
  void validation() {
    final FormState? _registerform = _registerformKey.currentState;
    if (_registerform!.validate()) {
      print("Yes");
    }
    else {
      print("No");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _registerformKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Register Page",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 450,
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      // Username Validation
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Please enter a Username with more than 6 characters!";
                        } else if (value.isEmpty) {
                          return "Please fill in a Username!";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      // E-mail Address Validation
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill in an E-mail Address!";
                        } else if (!emailRegExp.hasMatch(value)) {
                          return "Please enter a valid E-mail Address!";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.mail_outline_sharp, color: Colors.black),
                        hintText: "E-mail Address",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill in a Password!";
                        } else if (value.length < 8) {
                          return "Please enter a password with 8 characters!";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            obscureText == true?
                            Icons.visibility_off: Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill in a Phone Number";
                        } else if (value.length > 8 || value.length < 8 || !phoneRegExp.hasMatch(value)) {
                          return "Please enter a valid 8 digit (SG) phone number!";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_sharp,
                            color: Colors.black),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RawMaterialButton(
                        fillColor: AppColors.MAIN_COLOR,
                        elevation: 0.0,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          validation();
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("Already have an account?"),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => MainLoginPage(),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              "Login Here!",
                              style: TextStyle(color: AppColors.MAIN_COLOR),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
