// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/guestlistitempage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  double screenHeight = 0;
  double screenWidth = 0;

  String email = " ";
  String userName = " ";
  String userRights = " ";
  String userId = " ";
  String userPhoneNumber = " ";

  String _month = DateFormat('MMMM').format(
    DateTime.now(),
  );

  User? currentUser = FirebaseAuth.instance.currentUser;

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
    getUserId();
    DrownCheck().drownCheck;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    getUserId();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Attendance History",
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
                builder: (ctx) => GuestListItemsPage(
                  snapShot: guestfeaturedSnapshot,
                  appbarName: 'Featured Page',
                  name: 'Featured Page',
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Attendance History",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () async {
                      final month = await showMonthYearPicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2099),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                    primary: AppColors.MAIN_COLOR,
                                    secondary: AppColors.MAIN_COLOR,
                                    onSecondary: Colors.white),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      backgroundColor: AppColors.MAIN_COLOR),
                                ),
                                textTheme: const TextTheme(
                                  headline4:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  overline:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  button:
                                      TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              child: child!,
                            );
                          });
                      if (month != null) {
                        setState(() {
                          _month = DateFormat('MMMM').format(month);
                        });
                      }
                    },
                    child: Text(
                      "Select a Month Here",
                      style: TextStyle(
                          color: AppColors.MAIN_COLOR,
                          fontSize: screenWidth / 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Month: " + _month,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              height: screenHeight / 1.55,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(userId)
                    .collection("record")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        return DateFormat('MMMM')
                                    .format(snap[index]['date'].toDate()) ==
                                _month
                            ? Container(
                                height: 150,
                                margin: EdgeInsets.only(
                                    top: index > 0 ? 12 : 0,
                                    bottom: 12,
                                    left: 6,
                                    right: 6),
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
                                      child: Container(
                                        margin: const EdgeInsets.only(),
                                        decoration: BoxDecoration(
                                          color: AppColors.MAIN_COLOR,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            DateFormat('EE dd').format(
                                              snap[index]['date'].toDate(),
                                            ),
                                            style: TextStyle(
                                                fontSize: screenWidth / 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Check In",
                                            style: TextStyle(
                                                fontSize: screenWidth / 20,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            snap[index]['checkIn'],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Check Out",
                                            style: TextStyle(
                                                fontSize: screenWidth / 20,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            snap[index]['checkOut'],
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
                              )
                            : const SizedBox();
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
