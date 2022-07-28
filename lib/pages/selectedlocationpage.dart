// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, must_be_immutable, unnecessary_this, prefer_interpolation_to_compose_strings

import 'package:c300drowningdetection/models/mainlocation.dart';
import 'package:c300drowningdetection/models/sublocation.dart';
import 'package:c300drowningdetection/pages/poollocationdetails.dart';
import 'package:c300drowningdetection/pages/poollocationpage.dart';
import 'package:c300drowningdetection/widgets/locationicons.dart';
import 'package:flutter/material.dart';

class SelectedLocationPage extends StatelessWidget {
  MainLocation selectedLocation;
  SelectedLocationPage({required this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.selectedLocation.name + " Locations",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: this.selectedLocation.color,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => PoolLocationPage(),
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LocationIcons(
                    color: this.selectedLocation.color,
                    iconName: this.selectedLocation.icon),
                SizedBox(width: 5),
                Text(
                  this.selectedLocation.name,
                  style: TextStyle(
                      color: this.selectedLocation.color, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  this.selectedLocation.subCategories.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PoolLocationDetails(selectedLocation: this.selectedLocation.subCategories[index] as SubLocation)));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                                'assets/imgs/' +
                                    this
                                        .selectedLocation
                                        .subCategories[index]
                                        .imgName +
                                    '.png',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150),
                            Text(
                              this.selectedLocation.subCategories[index].name,
                              style:
                                  TextStyle(color: this.selectedLocation.color),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
