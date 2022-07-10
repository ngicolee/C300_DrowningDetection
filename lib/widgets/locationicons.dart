// ignore_for_file: unnecessary_this, must_be_immutable, use_key_in_widget_constructors

import 'package:c300drowningdetection/widgets/iconfont.dart';
import 'package:flutter/material.dart';

class LocationIcons extends StatelessWidget {
  Color color;
  String iconName;
  double size;

  LocationIcons({required this.color, required this.iconName, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Container(
            color: this.color,
            padding: const EdgeInsets.all(10),
            child: IconFont(
                color: Colors.white,
                iconName: this.iconName,
                size: this.size)));
  }
}
