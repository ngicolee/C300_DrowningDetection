// ignore_for_file: avoid_print

import 'package:c300drowningdetection/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  UserModel? userModel;
  List<UserModel> userList = [];

  Future<void> getUserData() async {
    List<UserModel> newUserList = [];
    User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection("users").get();
    for (var element in userSnapshot.docs) {
      if (currentUser?.uid == element.data()["userId"]) {
        userModel = UserModel(
          userEmail: element.data()["userEmail"],
          userGender: element.data()["userGender"],
          userPhoneNumber: element.data()["userPhoneNumber"],
          userName: element.data()["userName"],
          userRights: element.data()["userRights"],
        );
        newUserList.add(userModel!);
      }
      userList = newUserList;
    }
  }

  List<UserModel> get getUserModelList {
    return userList;
  }
}
