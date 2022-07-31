// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/models/pages.dart';
import 'package:c300drowningdetection/pages/admindeleteuserpage.dart';
import 'package:c300drowningdetection/pages/adminpanelpage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/mainregistrationpage.dart';
import 'package:c300drowningdetection/provider/page_provider.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  PageProvider? pageProvider;

  var adminSnapshot;
  var createUser;
  var manageUser;
  var deleteUser;

  String userRights = "Guest";

  @override
  void initState() {
    super.initState();
    _checkRole();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    DrownCheck().drownCheck;
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();

    setState(() {
      userRights = snap["userRights"];
    });
  }

  Widget _buildDetection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Manage Users",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 725,
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        // Page Route would be changed after completion of 'Detection System' pages
                        builder: (ctx) => MainRegistrationPage(),
                      ),
                    );
                  },
                  child: CategorisedPage(
                    image: manageUser!.image,
                    name: manageUser!.mainName,
                    subname: manageUser!.subName,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        // Page Route would be changed after completion of 'Pool Locations' pages
                        builder: (ctx) => AdminPanelPage(),
                      ),
                    );
                  },
                  child: CategorisedPage(
                    image: createUser!.image,
                    name: createUser!.mainName,
                    subname: createUser!.subName,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        // Page Route would be changed after completion of 'Pool Locations' pages
                        builder: (ctx) => AdminDeleteUserPage(),
                      ),
                    );
                  },
                  child: CategorisedPage(
                    image: deleteUser!.image,
                    name: deleteUser!.mainName,
                    subname: deleteUser!.subName,
                  ),
                ),
              ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Admin Page",
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
                builder: (ctx) => MainHomePage(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("pages")
              .doc("r3YfjXRPA2bt2uAP8241")
              .collection("adminpages")
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            adminSnapshot = snapshot;
            createUser = Pages(
                image: snapshot.data.docs[0]["image"],
                mainName: snapshot.data.docs[0]["mainname"],
                subName: snapshot.data.docs[0]["subname"]);
            manageUser = Pages(
                image: snapshot.data.docs[1]["image"],
                mainName: snapshot.data.docs[1]["mainname"],
                subName: snapshot.data.docs[1]["subname"]);
            deleteUser = Pages(
                image: snapshot.data.docs[2]["image"],
                mainName: snapshot.data.docs[2]["mainname"],
                subName: snapshot.data.docs[2]["subname"]);
            return Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildDetection(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
