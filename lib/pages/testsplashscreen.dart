// ignore_for_file: annotate_overrides, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/mainregistrationpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestSplashScreen extends StatefulWidget {
  const TestSplashScreen({Key? key}) : super(key: key);

  @override
  State<TestSplashScreen> createState() => _TestSplashScreenState();
}

class _TestSplashScreenState extends State<TestSplashScreen> {
  String userRights = "Guest";

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("User")
        .doc(user?.uid)
        .get();

    setState(() {
      userRights = snap["userRights"];
    });

    if (userRights == "Guest") {
      navigateNext(GuestHomePage());
    } else if (userRights == "Admin") {
      navigateNext(MainHomePage());
    }
  }

  void navigateNext(Widget route) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => route));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
