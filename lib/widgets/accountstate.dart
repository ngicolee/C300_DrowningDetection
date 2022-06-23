// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, empty_constructor_bodies, prefer_const_constructors_in_immutables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:flutter/material.dart';

class AccountState extends StatelessWidget {
  late final String accPage;
  late final VoidCallback onTap;
  late final String name;

  AccountState({required this.accPage, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(accPage),
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              name,
              style: TextStyle(color: AppColors.MAIN_COLOR),
            ),
          ),
        ),
      ],
    );
  }
}
