// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:flutter/material.dart';

class QRPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QR Page",
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
                    snapShot: featuredSnapshot,
                    appbarName: 'Featured Page',
                    name: 'Featured Page',
                  ),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "QR Page",
              style: TextStyle(color: Colors.black, fontSize: 28.0),
            ),
          ],
        ),
      ),
    );
  }
}