// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/adminedituserdata.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/widgets/buttonswidget.dart';
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
  String userPhoneNumber = " ";

  bool editable = false;

  Widget _buildSingleCont({required String label, required String dataText}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              dataText,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextField({required String name}) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: name,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                maxRadius: 65,
                backgroundImage: AssetImage("assets/imgs/ProfilePicture.jpg")),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _buildSingleTextField(name: "Input User Email Address Here"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonsWidget(
                btnName: "Get User",
                onPressed: () async {
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
                    userPhoneNumber = snap.docs[0]['userPhoneNumber'];

                    editable = true;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "User Data",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  _buildSingleCont(label: "Email Address: ", dataText: email),
                  _buildSingleCont(label: "User Name: ", dataText: userName),
                  _buildSingleCont(
                      label: "Phone Number: ", dataText: userPhoneNumber),
                  _buildSingleCont(
                      label: "User Rights: ", dataText: userRights),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            editable
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonsWidget(
                      btnName: "Edit User Rights",
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminEditUserData(
                                uid: userId,
                                email: email,
                                user: userName,
                                userRights: userRights,
                                phoneNumber: userPhoneNumber),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
