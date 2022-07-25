// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, avoid_print, prefer_typing_uninitialized_variables, unused_element

import 'dart:io';

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/detectionsystemspage.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/pages/profilepage.dart';
import 'package:c300drowningdetection/pages/qrpage.dart';
import 'package:c300drowningdetection/pages/searchingfunction.dart';
import 'package:c300drowningdetection/provider/category_provider.dart';
import 'package:c300drowningdetection/provider/page_provider.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c300drowningdetection/models/pages.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/usermodel.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

Pages? cameradata;
Pages? mapdata;
Pages? qrdata;
Pages? profiledata;
Pages? admindata;

UserModel? userModel;

CategoryProvider? categoryprovider;
PageProvider? pageProvider;

var featuredSnapshot;

var camera;
var maps;
var qrcode;
var profile;

class _MainHomePageState extends State<MainHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final images = [
    'https://i0.wp.com/www.theaqualife.ca/wp-content/uploads/2020/05/Water-safety-post.png?resize=480%2C402&ssl=1',
    'https://www.enjoy-swimming.com/wp-content/uploads/swimming-pool-rules-2.jpg.webp',
    'https://i0.wp.com/www.theaqualife.ca/wp-content/uploads/2020/05/Water-safety-post.png?resize=480%2C402&ssl=1'
  ];

  File? _pickedImage;
  XFile? _image;
  Future<void> getImage({required ImageSource source}) async {
    _image = (await ImagePicker().pickImage(source: source))!;
    if (_image != null) {
      _pickedImage = File(_image!.path);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);
  }

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

  bool profileColor = false;

  Widget _buildUserAccountDrawerHeader() {
    List<UserModel> userModel = pageProvider!.userList;
    return Column(
        children: userModel.map((e) {
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.userName,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          maxRadius: 40,
          child: CircleAvatar(
            maxRadius: 65,
            backgroundImage: _pickedImage == null
                ? AssetImage("assets/imgs/TestProfilePicture.png")
                : FileImage(_pickedImage!) as ImageProvider,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        accountEmail: Text(
          e.userEmail,
          style: TextStyle(color: Colors.black),
        ),
      );
    }).toList());
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          _buildUserAccountDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                mapColor = false;
                qrColor = false;
                aboutColor = false;
                contactUsColor = false;
                profileColor = false;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => MainHomePage(),
                  ),
                );
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
                profileColor = false;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => PoolLocationPage(),
                  ),
                );
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
                profileColor = false;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => QRPage(),
                  ),
                );
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
                profileColor = false;
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
                profileColor = false;
              });
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                homeColor = false;
                mapColor = false;
                qrColor = false;
                aboutColor = false;
                contactUsColor = false;
                profileColor = true;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ProfilePage(),
                ),
              );
            },
            leading: Icon(Icons.person),
            title: Text("Profile"),
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

  Widget buildImage(String image, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(image, fit: BoxFit.cover),
      );

  Widget _buildCarouselSlider() {
    return Center(
        child: CarouselSlider.builder(
      options: CarouselOptions(
          height: 250,
          autoPlay: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final image = images[index];
        return buildImage(image, index);
      },
    ));
  }

  // Widget _buildCategories() {
  //   return Column(children: [
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           height: 30,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "Categories",
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //     Container(
  //       height: 100,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           GestureDetector(
  //             onTap: () {
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                   builder: (ctx) => ListItemsPage(
  //                     name: "Detection System",
  //                     snapShot: camera,
  //                     appbarName: 'Detection System Pages',
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: _buildCategoryCards("CameraIcon.png"),
  //           ),
  //           GestureDetector(
  //             onTap: () {
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                   builder: (ctx) => ListItemsPage(
  //                     name: "Map Pages",
  //                     snapShot: maps,
  //                     appbarName: 'Map Pages',
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: _buildCategoryCards("MapIcon.png"),
  //           ),
  //           GestureDetector(
  //             onTap: () {
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                   builder: (ctx) => ListItemsPage(
  //                     name: "QR Pages",
  //                     snapShot: qrcode,
  //                     appbarName: 'QR Pages',
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: _buildCategoryCards("QRIcon.png"),
  //           ),
  //           GestureDetector(
  //             onTap: () {
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                   builder: (ctx) => ListItemsPage(
  //                     name: "Profile Pages",
  //                     snapShot: profile,
  //                     appbarName: 'Profile Pages',
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: _buildCategoryCards("ProfileIcon.png"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ]);
  // }

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
                      snapshot: featuredSnapshot,
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
                    builder: (ctx) => DetectionSystemsPage(),
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
    pageProvider?.getUserData();
    pageProvider = Provider.of<PageProvider>(context);

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
            onPressed: () {
              showSearch(context: context, delegate: SearchingFunction());
            },
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
                                        .doc("r3YfjXRPA2bt2uAP8241")
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
                                          mainName: snapshot.data.docs[0]
                                              ["mainname"],
                                          subName: snapshot.data.docs[0]
                                              ["subname"]);
                                      mapdata = Pages(
                                          image: snapshot.data.docs[1]["image"],
                                          mainName: snapshot.data.docs[1]
                                              ["mainname"],
                                          subName: snapshot.data.docs[1]
                                              ["subname"]);
                                      qrdata = Pages(
                                          image: snapshot.data.docs[2]["image"],
                                          mainName: snapshot.data.docs[2]
                                              ["mainname"],
                                          subName: snapshot.data.docs[2]
                                              ["subname"]);
                                      profiledata = Pages(
                                          image: snapshot.data.docs[3]["image"],
                                          mainName: snapshot.data.docs[3]
                                              ["mainname"],
                                          subName: snapshot.data.docs[3]
                                              ["subname"]);
                                      admindata = Pages(
                                          image: snapshot.data.docs[4]["image"],
                                          mainName: snapshot.data.docs[4]
                                              ["mainname"],
                                          subName: snapshot.data.docs[4]
                                              ["subname"]);
                                      return Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: ListView(
                                          children: [
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    _buildCarouselSlider(),
                                                    SizedBox(height: 40),
                                                    // _buildCategories(),
                                                    // SizedBox(height: 40),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                              });
                        });
                  });
            }),
      ),
    );
  }
}
