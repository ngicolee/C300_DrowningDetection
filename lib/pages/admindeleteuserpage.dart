// ignore_for_file: prefer_const_constructors

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/adminpage.dart';
import 'package:c300drowningdetection/pages/adminpanelpage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:flutter/material.dart';

class AdminDeleteUserPage extends StatefulWidget {
  const AdminDeleteUserPage({Key? key}) : super(key: key);

  @override
  State<AdminDeleteUserPage> createState() => _AdminDeleteUserPageState();
}

class _AdminDeleteUserPageState extends State<AdminDeleteUserPage> {
  @override
  void initState() {
    super.initState();
    // _checkRole();
    DrownCheck().drownCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delete Users",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => AdminPage(),
                ),
              );
            }),
      ),
    );
  }
}
