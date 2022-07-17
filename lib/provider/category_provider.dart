import 'package:c300drowningdetection/models/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider {
  List<Pages> camera = [];
  late Pages cameraData;
  Future<void> getCameraData() async {
    List<Pages> newList = [];
    QuerySnapshot cameraSnapshot =
        FirebaseFirestore.instance
            .collection("categories")
            .doc("9s7SeemNZoGJKe0aZtBu")
            .collection("cameracat")
            .get() as QuerySnapshot<Object?>;
    for (var element in cameraSnapshot.docs) {
        Pages(
            image: element['image'],
            mainName: element['name'],
            subName: element['username']);
        newList.add(cameraData);
      }
    camera = newList;
  }
  List<Pages> get getCameraList {
    return camera;
  }
}
