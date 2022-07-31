// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/calendarpage.dart';
import 'package:c300drowningdetection/pages/currentdatepage.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/profilepage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  int selectedIcon = 0;

  String email = " ";
  String userName = " ";
  String userRights = " ";
  String userId = " ";
  String userPhoneNumber = " ";

  User? currentUser = FirebaseAuth.instance.currentUser;

  List<IconData> navigateIcons = [
    Icons.check,
    Icons.calendar_month,
    Icons.person,
  ];

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

    return Scaffold(
      
      body: IndexedStack(
        index: selectedIcon,
        children: [
          new CurrentDatePage(),
          new CalendarPage(),
          new ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.MAIN_COLOR,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < navigateIcons.length; i++) ...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = i;
                      });
                    },
                    child: Container(
                      height: screenHeight,
                      width: screenWidth,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              navigateIcons[i],
                              color: i == selectedIcon
                                  ? AppColors.MAIN_COLOR
                                  : Colors.black,
                              size: i == selectedIcon ? 40 : 30,
                            ),
                            i == selectedIcon
                                ? Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 3,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      color: AppColors.MAIN_COLOR,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
