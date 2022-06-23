// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CategorisedPage extends StatelessWidget {
  final String image;
  final String name;
  final String subname;
  CategorisedPage({required this.image, required this.name, required this.subname});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 350,
            width: 183.5,
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/$image"),
                    ),
                  ),
                ),
                Text(
                  subname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xff9b96d6),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}