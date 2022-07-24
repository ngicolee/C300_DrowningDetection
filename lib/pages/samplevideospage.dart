// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore


import 'package:c300drowningdetection/sliders/staticvideospage.dart';
import 'package:c300drowningdetection/sliders/staticvideospage2.dart';
import 'package:flutter/material.dart';

class SampleVideosPage extends StatelessWidget {
  SampleVideosPage({Key? key}) : super(key: key);
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          children: [
            VideoDemo(),
            VideoDemo2(),
          ]),
    );
  }
}
