// ignore_for_file: missing_required_param

import 'dart:ui';
import 'homecategory.dart';

class SubCategory extends HomeCategory {
  SubCategory(
      {required String name,
      required String icon,
      required Color color,
      required String imgName,
      required List<SubCategory> subCategories})
      : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            subCategories: subCategories);
}
