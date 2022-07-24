// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/models/pages.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/guestlistitempage.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/rtspPage.dart';
import 'package:c300drowningdetection/pages/samplevideospage.dart';
import 'package:c300drowningdetection/provider/page_provider.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetectionSystemsPage extends StatefulWidget {
  const DetectionSystemsPage({Key? key}) : super(key: key);

  @override
  State<DetectionSystemsPage> createState() => _DetectionSystemsPageState();
}

class _DetectionSystemsPageState extends State<DetectionSystemsPage> {
  PageProvider? pageProvider;

  var detectionSnapshot;
  var detection;
  var samplevids;

  String userRights = "Guest";

  @override
  void initState() {
    super.initState();
    _checkRole();
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
              "Featured",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    // Page Route would be changed after completion of 'Detection System' pages
                    builder: (ctx) => LiveStreamScreen(),
                  ),
                );
              },
              child: CategorisedPage(
                image: detection!.image,
                name: detection!.mainName,
                subname: detection!.subName,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    // Page Route would be changed after completion of 'Pool Locations' pages
                    builder: (ctx) => SampleVideosPage(),
                  ),
                );
              },
              child: CategorisedPage(
                image: samplevids!.image,
                name: samplevids!.mainName,
                subname: samplevids!.subName,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detection System",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (userRights == "Admin") {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => MainHomePage(),
                ),
              );
            } else if (userRights == "Guest") {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => GuestHomePage(),
                ),
              );
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("pages")
              .doc("r3YfjXRPA2bt2uAP8241")
              .collection("detectionpages")
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            detectionSnapshot = snapshot;
            detection = Pages(
                image: snapshot.data.docs[0]["image"],
                mainName: snapshot.data.docs[0]["mainname"],
                subName: snapshot.data.docs[0]["subname"]);
            samplevids = Pages(
                image: snapshot.data.docs[1]["image"],
                mainName: snapshot.data.docs[1]["mainname"],
                subName: snapshot.data.docs[1]["subname"]);
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
