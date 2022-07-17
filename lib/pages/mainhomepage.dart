// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/pages/rtspPage.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c300drowningdetection/models/pages.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

Pages? cameradata;
Pages? mapdata;
Pages? qrdata;
Pages? profiledata;

var featuredSnapshot;

var camera;
var maps;
var qrcode;
var profile;

class _MainHomePageState extends State<MainHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildCategoryCards(String image) {
    return CircleAvatar(
      maxRadius: 38,
      backgroundColor: AppColors.MAIN_COLOR,
      child: Container(
        height: 50,
        child: Image(
          color: Colors.white,
          image: AssetImage("assets/imgs/$image"),
        ),
      ),
    );
  }

  bool homeColor = true;

  bool mapColor = false;

  bool qrColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "dxterchua (WIP)",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
                maxRadius: 40,
                child: Image.asset("assets/imgs/TestProfilePicture.png")),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountEmail: Text(
              "dchua647@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                mapColor = false;
                qrColor = false;
                aboutColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: mapColor,
            onTap: () {
              setState(() {
                homeColor = false;
                mapColor = true;
                qrColor = false;
                aboutColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.map_sharp),
            title: Text("Google Maps"),
          ),
          ListTile(
            selected: qrColor,
            onTap: () {
              setState(() {
                homeColor = false;
                mapColor = false;
                qrColor = true;
                aboutColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.qr_code),
            title: Text("QR Code Scanner"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                homeColor = false;
                mapColor = false;
                qrColor = false;
                aboutColor = true;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                homeColor = false;
                mapColor = false;
                qrColor = false;
                aboutColor = false;
                contactUsColor = true;
              });
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => MainWelcomePage(),
                ),
              );
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListItemsPage(
                      name: "Detection System",
                      snapShot: camera,
                      appbarName: 'Detection System Pages',
                    ),
                  ),
                );
              },
              child: _buildCategoryCards("CameraIcon.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListItemsPage(
                      name: "Map Pages",
                      snapShot: maps,
                      appbarName: 'Map Pages',
                    ),
                  ),
                );
              },
              child: _buildCategoryCards("MapIcon.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListItemsPage(
                      name: "QR Pages",
                      snapShot: qrcode,
                      appbarName: 'QR Pages',
                    ),
                  ),
                );
              },
              child: _buildCategoryCards("QRIcon.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListItemsPage(
                      name: "Profile Pages",
                      snapShot: profile,
                      appbarName: 'Profile Pages',
                    ),
                  ),
                );
              },
              child: _buildCategoryCards("ProfileIcon.png"),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildFeatured() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Featured",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListItemsPage(
                      name: "Featured Page",
                      snapShot: featuredSnapshot,
                      appbarName: "Featured Page",
                    ),
                  ),
                );
              },
              child: Text(
                "View More",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
                image: cameradata!.image,
                name: cameradata!.mainName,
                subname: cameradata!.subName,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    // Page Route would be changed after completion of 'Pool Locations' pages
                    builder: (ctx) => PoolLocationPage(),
                  ),
                );
              },
              child: CategorisedPage(
                image: mapdata!.image,
                name: mapdata!.mainName,
                subname: mapdata!.subName,
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
      key: _key,
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.MAIN_COLOR,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _key.currentState?.openDrawer();
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("categories")
                .doc("9s7SeemNZoGJKe0aZtBu")
                .collection("cameracat")
                .get(),
            builder: (context, cameraSnapshot) {
              if (cameraSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              camera = cameraSnapshot;
              return FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("categories")
                      .doc("9s7SeemNZoGJKe0aZtBu")
                      .collection("mapcat")
                      .get(),
                  builder: (context, mapSnapshot) {
                    if (mapSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    maps = mapSnapshot;
                    return FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection("categories")
                            .doc("9s7SeemNZoGJKe0aZtBu")
                            .collection("qrcodecat")
                            .get(),
                        builder: (context, qrSnapshot) {
                          if (qrSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          qrcode = qrSnapshot;
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                            .collection("categories")
                            .doc("9s7SeemNZoGJKe0aZtBu")
                            .collection("profilecat")
                            .get(),
                        builder: (context, profileSnapshot) {
                          if (profileSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          profile = profileSnapshot;
                              return FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection("pages")
                                      .doc("dM44qotLzmLFaDeE9B3d")
                                      .collection("featuredpages")
                                      .get(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    featuredSnapshot = snapshot;
                                    cameradata = Pages(
                                        image: snapshot.data.docs[0]["image"],
                                        mainName: snapshot.data.docs[0]["mainname"],
                                        subName: snapshot.data.docs[0]["subname"]);
                                    mapdata = Pages(
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  _buildCategories(),
                                                  SizedBox(height: 40),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      _buildFeatured(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          );
                        });
                  });
            }),
      ),
    );
  }
}
