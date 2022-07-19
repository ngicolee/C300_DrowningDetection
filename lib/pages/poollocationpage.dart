// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable, unnecessary_this

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/utils.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/selectedlocationpage.dart';
import 'package:c300drowningdetection/widgets/locationcards.dart';
import 'package:flutter/material.dart';

class PoolLocationPage extends StatelessWidget {
  List poolLocations = Utils.getLocations();
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
