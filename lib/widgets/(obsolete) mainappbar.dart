// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_new, must_be_immutable, file_names

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/iconhelper.dart';
import 'package:c300drowningdetection/widgets/iconfont.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {

  Color colorTheme;

  MainAppBar({ this.colorTheme = AppColors.MAIN_COLOR });

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(70);
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: IconFont(
          iconName: IconFontHelper.APP_ICON,
          color: widget.colorTheme,
          size: 50),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: widget.colorTheme),
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            child: ClipOval(child: Image.asset('assets/imgs/Sample.png')))
      ],
    );
  }
}
