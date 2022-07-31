// ignore_for_file: missing_required_param

import 'dart:ui';
import 'package:c300drowningdetection/models/mainlocation.dart';

class SubLocation extends MainLocation {
  String description;
  double? long;
  double? lat;

  SubLocation(
      {required this.description,
      required String name,
      required String icon,
      required Color color,
      required String imgName,
      required String direction,
        required  this.long,
        required  this.lat,
      required List<MainLocation> subLocation})
      : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            direction: direction,
            subCategories: subLocation);
}
