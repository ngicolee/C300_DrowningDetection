// ignore_for_file: unnecessary_this, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:c300drowningdetection/models/mainlocation.dart';
import 'package:c300drowningdetection/widgets/locationicons.dart';
import 'package:flutter/material.dart';

class LocationCards extends StatelessWidget {
  late MainLocation locations;
  Function onCardClick;

  LocationCards({required this.locations, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    'assets/imgs/' + this.locations.imgName + '.png',
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    LocationIcons(
                        color: this.locations.color,
                        iconName: this.locations.icon),
                    SizedBox(width: 10),
                    Text(
                      this.locations.name,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
