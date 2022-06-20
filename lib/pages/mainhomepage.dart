// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/pages/rtspPage.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
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

  MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
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
        child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            _buildCategoryCards("CameraIcon.png"),
                            _buildCategoryCards("MapIcon.png"),
                            _buildCategoryCards("QRIcon.png"),
                            _buildCategoryCards("ProfileIcon.png"),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Featured",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) =>
                                          ListItemsPage(name: "Featured"),
                                    ),
                                  );
                                },
                                child: Text(
                                  "View More",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                      builder: (ctx) =>
                                          LiveStreamScreen(),
                                    ),
                                  );
                                },
                                child: CategorisedPage(
                                    image: "Camera2.png",
                                    name: "Detection System",
                                    subname: "Available Cameras"),
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
                                    subname: "Available Pools"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
