import 'dart:ui';
import 'package:c300drowningdetection/helpers/iconhelper.dart';
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
        subCategories: []
      ),
      HomeCategory(
        color: const Color.fromARGB(255, 0, 183, 255),
        name: "Coming Soon...",
        imgName: "ComingSoon",
        icon: IconFontHelper.MORE_DOTS,
        subCategories: []
      ),
      HomeCategory(
        color: const Color.fromARGB(255, 0, 183, 255),
        name: "Coming Soon...",
        imgName: "ComingSoon",
        icon: IconFontHelper.MORE_DOTS,
        subCategories: []
      ),
      HomeCategory(
        color: const Color.fromARGB(255, 0, 183, 255),
        name: "Coming Soon...",
        imgName: "ComingSoon",
        icon: IconFontHelper.MORE_DOTS,
        subCategories: []
      ),
      HomeCategory(
        color: const Color.fromARGB(255, 0, 183, 255),
        name: "QR Code Scanner",
        imgName: "QR_Code",
        icon: IconFontHelper.QR_CODE,
        subCategories: []
      ),
    ];
  }
}