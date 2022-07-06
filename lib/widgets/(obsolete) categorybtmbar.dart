// ignore_for_file: file_names

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:flutter/material.dart';

class CategoryBtmBar extends StatelessWidget {
  const CategoryBtmBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero)
        ]),
        height: 70,
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ClipOval(
            child: Material(
                child: IconButton(
              icon: const Icon(Icons.home, color: AppColors.MAIN_COLOR),
              onPressed: () {},
            )),
          ),
          ClipOval(
            child: Material(
                child: IconButton(
              icon: const Icon(Icons.map_sharp, color: AppColors.MAIN_COLOR),
              onPressed: () {},
            )),
          ),
          ClipOval(
            child: Material(
                child: IconButton(
              icon: const Icon(Icons.qr_code_2_sharp,
                  color: AppColors.MAIN_COLOR),
              onPressed: () {},
            )),
          ),
          ClipOval(
            child: Material(
                child: IconButton(
              icon: const Icon(Icons.settings, color: AppColors.MAIN_COLOR),
              onPressed: () {},
            )),
          ),
        ]));
  }
}
