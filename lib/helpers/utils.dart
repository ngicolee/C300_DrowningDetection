// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ui';
import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/iconhelper.dart';
import 'package:c300drowningdetection/models/mainlocation.dart';
import 'package:c300drowningdetection/models/sublocation.dart';
import 'package:flutter/material.dart';

class Utils {
  static List<MainLocation> getLocations() {
    return [
      MainLocation(
          color: Colors.red,
          name: "North",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Woodlands",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Yishun",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: Colors.purple,
          name: "North-East",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Ang Mo Kio",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Hougang",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Sengkang",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Serangoon",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Yio Chu Kang",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: Colors.green,
          name: "East",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Delta",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Heartbeat @ Bedok ActiveSG",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Pasir Ris",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Tampines",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: Colors.lightGreen,
          name: "West",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Bukit Batok",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Choa Chu Kang",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Clementi",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Jurong East",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Jurong Lake Gardens Pool",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Jurong West",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Senja-Cashew",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: AppColors.MAIN_COLOR,
          name: "Central",
          imgName: "ComingSoon",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Bishan",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Geylang East  ",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Jalan Besar",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Katong",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "MOE Evans",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Queenstown",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Toa Payoh",
                imgName: "Sample",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
    ];
  }
}
