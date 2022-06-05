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
          name: "Drowning Detection",
          imgName: "DetectionImage",
          icon: IconFontHelper.DETECTION_SYSTEM,
          subCategories: [
            SubCategory(
              color: AppColors.MAIN_COLOR,
              name: "Camera Feed",
              imgName: "Camera",
              icon: IconFontHelper.CAMERA,
              subCategories: []
            ),
            SubCategory(
              color: AppColors.MAIN_COLOR,
              name: "Others",
              imgName: "Sample",
              icon: IconFontHelper.MORE_DOTS,
              subCategories: []
            )
          ]),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "Coming Soon...",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: []),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "Coming Soon...",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: []),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "Coming Soon...",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: []),
      HomeCategory(
          color: const Color.fromARGB(255, 0, 183, 255),
          name: "QR Code",
          imgName: "QR_Code",
          icon: IconFontHelper.QR_CODE,
          subCategories: [
            SubCategory(
              color: AppColors.MAIN_COLOR,
              name: "QR Code Scanner",
              imgName: "QR_Code3",
              icon: IconFontHelper.CAMERA,
              subCategories: []
            ),
            SubCategory(
              color: AppColors.MAIN_COLOR,
              name: "My QR Code",
              imgName: "QR_Code2",
              icon: IconFontHelper.CAMERA,
              subCategories: []
            ),
          ]),
    ];
  }
}
