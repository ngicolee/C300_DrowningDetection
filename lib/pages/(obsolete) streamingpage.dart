// ignore_for_file: use_key_in_widget_constructors, unnecessary_this, must_be_immutable, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_unnecessary_containers

import 'package:c300drowningdetection/models/subcategory.dart';
import 'package:c300drowningdetection/widgets/(obsolete)%20mainappbar.dart';
import 'package:c300drowningdetection/widgets/locationicons.dart';
import 'package:flutter/material.dart';

class StreamingPage extends StatefulWidget {
  SubCategory subCategory;
  StreamingPage({required this.subCategory});

  @override
  StreamingPageState createState() => StreamingPageState();
}

class StreamingPageState extends State<StreamingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Stack(children: [
                Container(
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/imgs/' +
                                widget.subCategory.imgName +
                                '.png'),
                            fit: BoxFit.cover))),
                Positioned.fill(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent
                      ]))),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        LocationIcons(
                            color: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 30),
                        Column(children: const [
                          Text('Drowning Detection System',
                              style: TextStyle(color: Colors.white, fontSize: 15))
                        ])
                      ]),
                    )),
                    MainAppBar(
                      colorTheme: Colors.white,
                    )
              ]),
              Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Padding( padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text('Camera Feed would be implemented below')),

              //Container below would be allocated for video streaming.
              ])))
            ])));
  }
}
