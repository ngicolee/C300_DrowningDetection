// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, prefer_interpolation_to_compose_strings, avoid_print, avoid_unnecessary_containers, unused_label

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CurrentDatePage extends StatefulWidget {
  const CurrentDatePage({Key? key}) : super(key: key);

  @override
  State<CurrentDatePage> createState() => _CurrentDatePageState();
}

class _CurrentDatePageState extends State<CurrentDatePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  String email = " ";
  String userName = " ";
  String userRights = " ";
  String userId = " ";
  String userPhoneNumber = " ";

  String checkIn = "--/--";
  String checkOut = "--/--";

  User? currentUser = FirebaseAuth.instance.currentUser;

  bool loadPage = false;

  Future<String> getUserName() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("users").get();
    for (var element in snap.docs) {
      if (currentUser?.uid == element.data()["userId"]) {
        userName = element.data()["userName"];
      }
    }

    return userName;
  }

  Future<String> getUserId() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("users").get();
    for (var element in snap.docs) {
      if (currentUser?.uid == element.data()["userId"]) {
        userId = element.data()["userId"];
      }
    }

    return userId;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getRecords());
  }

  void _getRecords() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .where("userId", isEqualTo: userId)
          .get();

      DocumentSnapshot docSnap = await FirebaseFirestore.instance
          .collection("users")
          .doc(snap.docs[0].id)
          .collection("record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();
      setState(() {
        checkIn = docSnap["checkIn"];
        checkOut = docSnap["checkOut"];
      });
    } catch (e) {
      setState(() {
        checkIn = "--/--";
        checkOut = "--/--";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    getUserId();
    getUserName();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lifeguard Attendance",
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
                builder: (ctx) => ListItemsPage(
                  appbarName: 'Featured Page',
                  snapshot: featuredSnapshot,
                  name: 'Featured',
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome",
                style:
                    TextStyle(color: Colors.black, fontSize: screenWidth / 20),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lifeguard " + userName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth / 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Status",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth / 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 12, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.MAIN_COLOR,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                              fontSize: screenWidth / 20, color: Colors.black),
                        ),
                        Text(
                          checkIn,
                          style: TextStyle(
                              fontSize: screenWidth / 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                              fontSize: screenWidth / 20, color: Colors.black),
                        ),
                        Text(
                          checkOut,
                          style: TextStyle(
                              fontSize: screenWidth / 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                      color: AppColors.MAIN_COLOR,
                      fontSize: screenWidth / 18,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: DateFormat(' MMM yyyy').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          color: Colors.black, fontSize: screenWidth / 20),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
                stream: Stream.periodic(
                  const Duration(seconds: 1),
                ),
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('hh:mm:ss a').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
            checkOut == "--/--"
                ? Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> slideKey =
                            GlobalKey();

                        return SlideAction(
                          text: checkIn == "--/--"
                              ? "Slide to Check In"
                              : "Slide to Check Out",
                          innerColor: AppColors.MAIN_COLOR,
                          outerColor: Colors.white,
                          textStyle: TextStyle(
                            color: AppColors.MAIN_COLOR,
                            fontSize: screenWidth / 18,
                          ),
                          key: slideKey,
                          onSubmit: () async {
                            slideKey.currentState!.reset();
                            QuerySnapshot<Map<String, dynamic>> snap =
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .where("userId", isEqualTo: userId)
                                    .get();
                            for (var element in snap.docs) {
                              if (currentUser?.uid ==
                                  element.data()["userId"]) {
                                userId = element.data()["userId"];
                              }
                            }

                            DocumentSnapshot docSnap = await FirebaseFirestore
                                .instance
                                .collection("users")
                                .doc(snap.docs[0].id)
                                .collection("record")
                                .doc(DateFormat('dd MMMM yyyy')
                                    .format(DateTime.now()))
                                .get();

                            try {
                              String checkIn = docSnap['checkIn'];

                              setState(() {
                                checkOut =
                                    DateFormat('hh:mm').format(DateTime.now());
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(snap.docs[0].id)
                                  .collection("record")
                                  .doc(DateFormat('dd MMMM yyyy')
                                      .format(DateTime.now()))
                                  .update(
                                {
                                  'checkIn': checkIn,
                                  'checkOut':
                                      DateFormat('hh:mm').format(DateTime.now())
                                },
                              );
                            } catch (e) {
                              setState(() {
                                checkIn =
                                    DateFormat('hh:mm').format(DateTime.now());
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(snap.docs[0].id)
                                  .collection("record")
                                  .doc(DateFormat('dd MMMM yyyy')
                                      .format(DateTime.now()))
                                  .set(
                                {
                                  'checkIn': DateFormat('hh:mm').format(
                                    DateTime.now(),
                                  ),
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "You have completed today's day.",
                      style: TextStyle(
                          color: Colors.black, fontSize: screenWidth / 20),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
