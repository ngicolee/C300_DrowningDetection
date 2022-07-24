// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/adminedituserdata.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  TextEditingController emailController = new TextEditingController();

  String email = " ";
  String userName = " ";
  String userRights = " ";
  String userId = " ";

  bool editable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic Admin Panel",
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
            }),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            Text(
              "I'll refine it tomorrow, tired.",
              style: TextStyle(color: Colors.white),
            ),
            GestureDetector(
              onTap: () async {
                String userEmail = emailController.text.trim();
                final QuerySnapshot snap = await FirebaseFirestore.instance
                    .collection('users')
                    .where('userEmail', isEqualTo: userEmail)
                    .get();
                setState(() {
                  email = userEmail;
                  userName = snap.docs[0]['userName'];
                  userRights = snap.docs[0]['userRights'];
                  userId = snap.docs[0]['userId'];

                  editable = true;
                });
              },
              child: Container(
                height: 50,
                width: 100,
                color: AppColors.MAIN_COLOR,
                child: Center(
                  child: Text(
                    "Get User Data",
                  ),
                ),
              ),
            ),
            editable
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdminEditUserData(uid: userId)));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: AppColors.MAIN_COLOR,
                      child: Center(
                        child: Text(
                          "Edit User Data",
                        ),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 50,
            ),
            Text("User Data: "),
            SizedBox(
              height: 50,
            ),
            Text("User Email: " + email),
            Text("User Name: " + userName),
            Text("User Rights: " + userRights),
          ],
        ),
      ),
    );
  }
}
