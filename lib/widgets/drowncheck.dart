// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class DrownCheck extends StatelessWidget {
  const DrownCheck({Key? key}) : super(key: key);

  void sendPushMessage() async {
    FirebaseMessaging.instance.subscribeToTopic("Drowning");
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAhjRHnas:APA91bERtpmLFJrxSm-XyJJFwdAwrQ3fM05WodFPWR5aGhVi7S7_0_Dobdwi5LFNkq9g1-VKVe0xrZ7-mudzliQgaQQ2O58ap7q7CQRV6Kh5B90RYukaqrYg7M06wupdyAgKHw84cQ6V',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'Drowning Detected!',
              'title': 'ALERT!'
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": "/topics/Drowning",
          },
        ),
      );
    } catch (e) {
      print("Error push notification");
    }
  }

  Future<bool> drownCheck() async {
    String drown = "0";
    bool drowning = false;

    DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
        .instance
        .collection("drowning")
        .doc("SfrIbW6CA8t4ymLTpmQ3")
        .get();

    drown = snap['drown'];

    if (drown == "1") {
      drowning = true;
      sendPushMessage();
    } else {
      drowning = false;
    }
    return drowning;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
