// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, file_names

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/mainregistrationpage.dart';
import 'package:c300drowningdetection/widgets/accountstate.dart';
import 'package:c300drowningdetection/widgets/buttonswidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainLoginPage3 extends StatefulWidget {
  const MainLoginPage3({Key? key}) : super(key: key);

  @override
  State<MainLoginPage3> createState() => _MainLoginPage3State();
}


String emailRE =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp emailRegExp = RegExp(emailRE);

bool obscureText = true;

class _MainLoginPage3State extends State<MainLoginPage3> {
  Future<User?> loginCredentials(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter an E-mail Address!";
                        } else if (!emailRegExp.hasMatch(value)) {
                          return "Please enter a valid E-mail Address!";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.mail_outline_sharp, color: Colors.black),
                        border: OutlineInputBorder(),
                        hintText: "E-mail Address",
                        hintStyle: TextStyle(color: Colors.black),
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
                        border: OutlineInputBorder(),
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
                              color: Colors.black),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    ButtonsWidget(
                      btnName: "Login",
                      onPressed: () async {
                        User? user = await loginCredentials(
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context);
                        print(user);
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => MainHomePage(),
                            ),
                          );
                        }
                      },
                    ),
                    AccountState(
                      accPage: "Don't have an account?",
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => MainRegistrationPage()));
                      },
                      name: 'Register Here!',
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
