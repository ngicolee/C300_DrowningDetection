// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnName;
  ButtonsWidget({required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: RawMaterialButton(
        fillColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: onPressed,
        child: Text(
          btnName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
