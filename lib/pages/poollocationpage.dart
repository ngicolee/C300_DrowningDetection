// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable, unnecessary_this

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/utils.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/guestlistitempage.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/selectedlocationpage.dart';
import 'package:c300drowningdetection/widgets/locationcards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/drowncheck.dart';

class PoolLocationPage extends StatefulWidget {
  @override
  State<PoolLocationPage> createState() => _PoolLocationPageState();
}

class _PoolLocationPageState extends State<PoolLocationPage> {
  List poolLocations = Utils.getLocations();

  String userRights = "Guest";

  @override
  void initState() {
    super.initState();
    _checkRole();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pool Locations",
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
                    builder: (ctx) => ListItemsPage(
                      snapshot: featuredSnapshot,
                      appbarName: 'Featured Page',
                      name: 'Featured Page',
                    ),
                  ),
                );
              } else if (userRights == "Guest") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => GuestListItemsPage(
                      snapShot: guestfeaturedSnapshot,
                      appbarName: 'Featured Page',
                      name: 'Featured Page',
                    ),
                  ),
                );
              }
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Select your location preference:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: poolLocations.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return LocationCards(
                    locations: poolLocations[index],
                    onCardClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedLocationPage(
                            selectedLocation: this.poolLocations[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
