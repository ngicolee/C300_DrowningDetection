// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, body_might_complete_normally_nullable, unused_element, avoid_print, unnecessary_new, sized_box_for_whitespace, use_key_in_widget_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:c300drowningdetection/helpers/appcolors.dart';

import 'package:c300drowningdetection/pages/testsplashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({Key? key}) : super(key: key);

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  // Initialise Firebase App
  Future<FirebaseApp> _initializeFireBase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: _initializeFireBase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Email Address is Invalid."),
          ),
        );
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Email Address has been disabled."),
          ),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("There is no user corresponding to the email address."),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "Password is Incorrect, Please enter the correct password."),
          ),
        );
      } else if (e.code == 'unknown') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please Enter an Email Address and Password."),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
      }
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(e.message.toString()),
      //     ),
      //   );
      // } catch (e) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text("Unknown Error, Please Try Again Later!"),
      //     ),
      //   );
    }
    return user;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  late RegExp regExp = new RegExp(p);

  @override
  Widget build(BuildContext context) {
    // Create Textfield Controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
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
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Login Page",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 44.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Fill in an E-mail Address";
                    } else if (!regExp.hasMatch(value)) {
                      return "Email is Invalid";
                    }
                    return "";
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "E-mail Address",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Please Fill in Password";
                    }
                    return "";
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "User Password",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.0),
                // AccountState(
                //   accPage: "Don't have an account?",
                //   onTap: () {
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(
                //         builder: (ctx) => MainRegistrationPage(),
                //       ),
                //     );
                //   },
                //   name: 'Register Here',
                // ),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: AppColors.MAIN_COLOR,
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    onPressed: () async {
                      User? user = await loginCredentials(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => //MainHomePage(),
                                TestSplashScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
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
