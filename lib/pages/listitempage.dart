// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/camerapage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/pages/profilepage.dart';
import 'package:c300drowningdetection/pages/qrpage.dart';
import 'package:c300drowningdetection/pages/rtspPage.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:flutter/material.dart';

class ListItemsPage extends StatelessWidget {
  final String name;
  ListItemsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Featured Page",
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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 560,
                  child: GridView.count(
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.5,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      // Page Route would be changed after completion of 'Pool Locations' pages
                                      builder: (ctx) =>
                                          LiveStreamScreen(),
                                    ),
                                  );
                                },
                          child: CategorisedPage(
                            image: "Camera2.png",
                            name: "Detection System",
                            subname: "Available Cameras",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      // Page Route would be changed after completion of 'Pool Locations' pages
                                      builder: (ctx) =>
                                          PoolLocationPage(),
                                    ),
                                  );
                                },
                          child: CategorisedPage(
                            image: "Maps.png",
                            name: "Pool Locations",
                            subname: "Available Pools",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      // Page Route would be changed after completion of 'Pool Locations' pages
                                      builder: (ctx) =>
                                          QRPage(),
                                    ),
                                  );
                                },
                          child: CategorisedPage(
                            image: "QR_Code4.png",
                            name: "QR Codes",
                            subname: "My QR Code",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      // Page Route would be changed after completion of 'Pool Locations' pages
                                      builder: (ctx) =>
                                          ProfilePage(),
                                    ),
                                  );
                                },
                          child: CategorisedPage(
                            image: "Profile.png",
                            name: "Profile Page",
                            subname: "My Profile Page",
                          ),
                        ),
                      ]),
                ),           
              ],
            ),
          ],
        ),
      ),
    );
  }
}