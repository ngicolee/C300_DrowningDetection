// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/adminpage.dart';
import 'package:c300drowningdetection/pages/detectionsystemspage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/pages/profilepage.dart';
import 'package:c300drowningdetection/widgets/categorisedpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/drowncheck.dart';

class ListItemsPage extends StatefulWidget {
  final String name;
  final String appbarName;
  final snapshot;
  ListItemsPage(
      {required this.name, required this.snapshot, required this.appbarName});

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    DrownCheck().drownCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appbarName,
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
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(Icons.notifications_none, color: Colors.white),
          //     onPressed: () {}),
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
                            widget.name,
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
                  height: 725,
                  child: GridView.count(
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
                                builder: (ctx) => DetectionSystemsPage(),
                              ),
                            );
                          },
                          child: CategorisedPage(
                            image: widget.snapshot.data.docs[0]["image"],
                            name: widget.snapshot.data.docs[0]["mainname"],
                            subname: widget.snapshot.data.docs[0]["subname"],
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //         // Page Route would be changed after completion of 'Pool Locations' pages
                        //         builder: (ctx) => AttendancePage(),
                        //       ),
                        //     );
                        //   },
                        //   child: CategorisedPage(
                        //     image: snapshot.data.docs[6]["image"],
                        //     name: snapshot.data.docs[6]["mainname"],
                        //     subname: snapshot.data.docs[6]["subname"],
                        //   ),
                        // ),
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
                            image: widget.snapshot.data.docs[1]["image"],
                            name: widget.snapshot.data.docs[1]["mainname"],
                            subname: widget.snapshot.data.docs[1]["subname"],
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
                            image: widget.snapshot.data.docs[3]["image"],
                            name: widget.snapshot.data.docs[3]["mainname"],
                            subname: widget.snapshot.data.docs[3]["subname"],
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //         // Page Route would be changed after completion of 'Pool Locations' pages
                        //         builder: (ctx) => SMSPage(),
                        //       ),
                        //     );
                        //   },
                        //   child: CategorisedPage(
                        //     image: snapshot.data.docs[4]["image"],
                        //     name: snapshot.data.docs[4]["mainname"],
                        //     subname: snapshot.data.docs[4]["subname"],
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                // Page Route would be changed after completion of 'Pool Locations' pages
                                builder: (ctx) => AdminPage(),
                              ),
                            );
                          },
                          child: CategorisedPage(
                            image: widget.snapshot.data.docs[5]["image"],
                            name: widget.snapshot.data.docs[5]["mainname"],
                            subname: widget.snapshot.data.docs[5]["subname"],
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
