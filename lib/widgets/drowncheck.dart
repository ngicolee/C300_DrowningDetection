// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class DrownCheck extends StatelessWidget {
  const DrownCheck({Key? key}) : super(key: key);

  void sendPushMessage() async {
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
              'body': "There is someone drowning. Please act accordingly!",
              'title': 'ALERT: Drowning Detected'
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
    String drown = "0_All_Clear";
    bool drowning = false;

    DatabaseReference ref = FirebaseDatabase.instance.ref("DetectedDrowning");
    Stream<DatabaseEvent> stream = ref.onValue;

    stream.listen((DatabaseEvent event) {
      drown = '${event.snapshot.value}';
      // print('Event Type: ${event.snapshot.value}'); for debug purposes

      if (drown == "1_Drowning_Detected") {
        drowning = true;
        sendPushMessage();
      } else {
        drowning = false;
      }
    });

    return drowning;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
