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
          direction: "North",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.red,
                name: "Woodlands",
                imgName: "Woodlands",
                direction: "3 Woodlands Street 13\nSingapore 738600",
                icon: IconFontHelper.MORE_DOTS,
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                subLocation: []),
            SubLocation(
                color: Colors.red,
                name: "Yishun",
                imgName: "Yishun",
                direction: "North",
                icon: IconFontHelper.MORE_DOTS,
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                subLocation: []),
          ]),
      MainLocation(
          color: Colors.purple,
          name: "North-East",
          imgName: "ComingSoon",
          direction: "North-East",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.purple,
                name: "Ang Mo Kio",
                imgName: "AngMoKio",
                direction: "North-East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.purple,
                name: "Hougang",
                imgName: "Hougang",
                direction: "North-East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.purple,
                name: "Sengkang",
                imgName: "Sengkang",
                direction: "North-East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.purple,
                name: "Serangoon",
                imgName: "Serangoon",
                direction: "North-East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.purple,
                name: "Yio Chu Kang",
                imgName: "YioChuKang",
                direction: "North-East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: Colors.green,
          name: "East",
          imgName: "ComingSoon",
          direction: "East",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.green,
                name: "Delta",
                imgName: "Delta",
                direction: "East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.green,
                name: "Heartbeat @ Bedok ActiveSG",
                imgName: "Bedok",
                direction: "East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.green,
                name: "Pasir Ris",
                imgName: "PasirRis",
                direction: "East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.green,
                name: "Tampines",
                imgName: "Tampines",
                direction: "East",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: Colors.lightGreen,
          name: "West",
          imgName: "ComingSoon",
          direction: "West",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.lightGreen,
                name: "Bukit Batok",
                imgName: "BukitBatok",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.lightGreen,
                name: "Choa Chu Kang",
                imgName: "ChoaChuKang",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.lightGreen,
                name: "Clementi",
                imgName: "Clementi",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.lightGreen,
                name: "Jurong East",
                imgName: "JurongEast",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.lightGreen,
                name: "Jurong Lake Gardens",
                imgName: "JurongLakeGardens",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.lightGreen,
                name: "Jurong West",
                imgName: "JurongWest",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: Colors.lightGreen,
                name: "Senja-Cashew",
                imgName: "Senja-Cashew",
                direction: "West",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
      MainLocation(
          color: AppColors.MAIN_COLOR,
          name: "Central",
          imgName: "ComingSoon",
          direction: "Central",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Bishan",
                imgName: "Bishan",
                direction: "Central",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Geylang East",
                imgName: "GeylangEast",
                direction: "Central",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Jalan Besar",
                imgName: "JalanBesar",
                direction: "Central",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Katong",
                imgName: "Katong",
                direction: "Central",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "MOE Evans",
                imgName: "MOEEvans",
                direction: "Central",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Queenstown",
                imgName: "Queenstown",
                direction: "Central",
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                description: "",
                name: "Toa Payoh",
                imgName: "ToaPayoh",
                direction: "Central",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: []),
          ]),
    ];
  }
}
