// ignore_for_file: prefer_final_fields

import 'package:c300drowningdetection/models/message_model.dart';
import 'package:flutter/cupertino.dart';

class MQTTModel with ChangeNotifier {
  var _message = <Messages>[];

  List<Messages> get message => _message;

  void addMessage(Messages message) {
    _message.add(message);
    notifyListeners();
  }
}
