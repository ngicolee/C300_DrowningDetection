// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconFont extends StatelessWidget {
  Color color;
  double size;
  String iconName;

  IconFont(
      {Key? key,
      required this.color,
      required this.size,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.iconName,
        style: TextStyle(
            color: this.color, fontSize: this.size, fontFamily: 'custom'));
  }
}
