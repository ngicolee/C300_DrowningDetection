// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_print

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:c300drowningdetection/widgets/accountstate.dart';
import 'package:c300drowningdetection/widgets/buttonswidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainRegistrationPage extends StatefulWidget {
  @override
  State<MainRegistrationPage> createState() => _MainRegistrationPageState();

  static void ensureInitialized() {}
}

GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

String emailRE =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
String phoneRE = r'(9|8){1}[0-9]{7}$';

RegExp emailRegExp = RegExp(emailRE);
RegExp phoneRegExp = RegExp(phoneRE);

bool obscureText = true;
bool isMale = true;
bool isAdmin = true;

String? userName;
late String email;
late String password;
String? phoneNumber;

class _MainRegistrationPageState extends State<MainRegistrationPage> {
  void validation() async {
    final FormState? _form = _registerKey.currentState;
    if (!_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        FirebaseFirestore.instance
            .collection("users")
            .doc(result.user?.uid)
            .set(
          {
            "userName": userName,
            "userId": result.user?.uid,
            "userEmail": email,
            "userGender": isMale == true ? "Male" : "Female",
            "userPhoneNumber": phoneNumber,
            "userRights": isAdmin == true ? "Admin" : "Guest"
          },
        );
      } on PlatformException catch (e) {
        print(e.message.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _registerKey,
            child: Column(
              children: [
                SizedBox(height: 5),
                Center(
                  child: ClipOval(
                    child: Container(
                        width: 160,
                        height: 160,
                        color: AppColors.MAIN_COLOR,
                        alignment: Alignment.center,
                        child: const Icon(Icons.pool_sharp,
                            color: Colors.white, size: 130)),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Registration",
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 30),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
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
                      SizedBox(height: 20),
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
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline_sharp,
                              color: Colors.black),
                          hintText: "E-mail Address",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
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
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
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
                              obscureText == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = !isMale;
                          });
                        },
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  isMale == true ? "Male" : "Female",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill in a Phone Number";
                          } else if (value.length > 8 ||
                              value.length < 8 ||
                              !phoneRegExp.hasMatch(value)) {
                            return "Please enter a valid 8 digit (SG) phone number!";
                          }
                          return "";
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android_sharp,
                              color: Colors.black),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      AccountState(
                        accPage: "Already have an account?",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => MainLoginPage()));
                        },
                        name: 'Login Here!',
                      ),
                      SizedBox(height: 10),
                      ButtonsWidget(
                        btnName: "Register",
                        onPressed: () {
                          validation();
                          isAdmin = false;
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
