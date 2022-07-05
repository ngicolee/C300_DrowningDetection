// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ui';
import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/iconhelper.dart';
import 'package:c300drowningdetection/models/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:c300drowningdetection/models/homecategory.dart';

class Utils {
  static List<HomeCategory> getCategories() {
    return [
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "North Side",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubCategory(
              color: AppColors.MAIN_COLOR,
              name: "",
              imgName: "Test1",
              icon: IconFontHelper.CAMERA,
              subCategories: []
            ),
            SubCategory(
              color: AppColors.MAIN_COLOR,
              name: "Test2",
              imgName: "Sample",
              icon: IconFontHelper.MORE_DOTS,
              subCategories: []
            )
          ]),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "South Side",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: []),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "East Side",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: []),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "West Side",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: []),
    ];
  }
}
