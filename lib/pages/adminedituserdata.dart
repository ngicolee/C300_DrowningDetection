// ignore_for_file: prefer_const_constructors

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AdminEditUserData extends StatefulWidget {
  final String uid;

  const AdminEditUserData({Key? key, required this.uid}) : super(key: key);

  @override
  State<AdminEditUserData> createState() => _AdminEditUserDataState();
}

class _AdminEditUserDataState extends State<AdminEditUserData> {
  TextEditingController userRightsController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: userRightsController,
              decoration: InputDecoration(hintText: "User Rights"),
            ),
          ),
          GestureDetector(
            onTap: () async {
              String newRole = userRightsController.text.trim();

              FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.uid)
                  .update(
                {'userRights': newRole},
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 100,
                color: AppColors.MAIN_COLOR,
                child: Center(
                  child: Text("Update Data"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
