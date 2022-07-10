// ignore_for_file: missing_required_param

import 'dart:ui';
import 'package:c300drowningdetection/models/mainlocation.dart';

import 'mainlocation.dart';

class SubLocation extends MainLocation {
  SubLocation(
      {required String name,
      required String icon,
      required Color color,
      required String imgName,
      required List<MainLocation> subLocation})
      : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            subCategories: subLocation);
}
