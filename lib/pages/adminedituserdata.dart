// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/models/usermodel.dart';
import 'package:c300drowningdetection/pages/adminpanelpage.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/widgets/buttonswidget.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AdminEditUserData extends StatefulWidget {
  final String uid;
  final String email;
  final String user;
  final String userRights;
  final String phoneNumber;

  const AdminEditUserData(
      {Key? key,
      required this.uid,
      required this.email,
      required this.user,
      required this.userRights,
      required this.phoneNumber})
      : super(key: key);

  @override
  State<AdminEditUserData> createState() => _AdminEditUserDataState();
}

class _AdminEditUserDataState extends State<AdminEditUserData> {
  TextEditingController userRightsController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    // _checkRole();
    DrownCheck().drownCheck();
  }

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

  Widget _buildContainer() {
    List<UserModel> userModel = pageProvider!.userList;
    return Column(
      children: userModel.map((e) {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleCont(
                  label: "Email Address: ", dataText: widget.email),
              _buildSingleCont(label: "User Name: ", dataText: widget.user),
              _buildSingleCont(
                  label: "Phone Number:", dataText: widget.phoneNumber),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Panel",
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
                  builder: (ctx) => AdminPanelPage(),
                ),
              );
            }),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 65,
              backgroundImage: AssetImage("assets/imgs/ProfilePicture.jpg"),
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
            _buildContainer(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        String role = "";
                        bool newRole = isAdmin;
                        if (newRole == false) {
                          role = "Admin";
                        } else {
                          role = "Guest";
                        }

                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.uid)
                            .update(
                          {'userRights': role},
                        );
                        setState(() {
                          isAdmin = !isAdmin;
                        });
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "User Rights (Tap here):",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  isAdmin == true ? "Admin" : "Guest",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
