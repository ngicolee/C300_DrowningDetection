// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/pages/profilepage.dart';
import 'package:c300drowningdetection/pages/qrpage.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:flutter/material.dart';

class GuestListItemsPage extends StatelessWidget {
  final String name;
  final String appbarName;
  final snapShot;
  GuestListItemsPage(
      {required this.name, required this.snapShot, required this.appbarName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarName,
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
                builder: (ctx) => GuestHomePage(),
              ),
            );
          },
        ),
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
                  height: 525,
                  child:
                      // GridView.count(
                      //   crossAxisCount: 2,
                      //   scrollDirection: Axis.vertical,
                      //   children: snapShot
                      //       .map(
                      //         (e) => CategorisedPage(
                      //             image: e.image,
                      //             name: e.mainName,
                      //             subname: e.subName),
                      //       )
                      //       .toList(),
                      // ),
                      GridView.count(
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
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
                            image: snapShot.data.docs[0]["image"],
                            name: snapShot.data.docs[0]["mainname"],
                            subname: snapShot.data.docs[0]["subname"],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                // Page Route would be changed after completion of 'Pool Locations' pages
                                builder: (ctx) => QRPage(),
                              ),
                            );
                          },
                          child: CategorisedPage(
                            image: snapShot.data.docs[1]["image"],
                            name: snapShot.data.docs[1]["mainname"],
                            subname: snapShot.data.docs[1]["subname"],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                // Page Route would be changed after completion of 'Pool Locations' pages
                                builder: (ctx) => ProfilePage(),
                              ),
                            );
                          },
                          child: CategorisedPage(
                            image: snapShot.data.docs[2]["image"],
                            name: snapShot.data.docs[2]["mainname"],
                            subname: snapShot.data.docs[2]["subname"],
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
