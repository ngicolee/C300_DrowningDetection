// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:c300drowningdetection/models/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider {
  List<Pages> camera = [];
  late Pages cameraData;
  Future<void> getCameraData() async {
    List<Pages> newList = [];
    QuerySnapshot cameraSnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("9s7SeemNZoGJKe0aZtBu")
        .collection("cameracat")
        .get();
    cameraSnapshot.docs.forEach((element) {
      cameraData = Pages(
          image: element['image'],
          mainName: element['name'],
          subName: element['username']);
      newList.add(cameraData);
    });
    camera = newList;
  }

  List<Pages> get getCameraList {
    return camera;
  }
}
