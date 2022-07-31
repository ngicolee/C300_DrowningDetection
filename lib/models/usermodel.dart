// ignore_for_file: unused_import

import 'package:c300drowningdetection/pages/mainregistrationpage.dart';
import 'package:flutter/material.dart';

class UserModel {
  String userName, userEmail, userGender, userPhoneNumber, userRights;
  static double lat = 0;
  static double long = 0;
  UserModel(
      {required this.userEmail,
      required this.userGender,
      required this.userName,
      required this.userPhoneNumber,
      required this.userRights});
}

String? get getUserName {
  return userName;
}
