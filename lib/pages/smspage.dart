import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:flutter/material.dart';


class SMSPage extends StatefulWidget {
  //SMSPage({required Key key, required this.title}) : super(key: key);
  @override
  _SMSPageState createState() => _SMSPageState();
}
class _SMSPageState extends State<SMSPage> {
  late TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACcc598c8528c0b7ac513c078a2cfb1c6b',
        authToken: 'b7006c0ba565d87a1f7a90b1af6d40b2',
        twilioNumber: '+12058097139');
    super.initState();
  }
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '97730754', messageBody: 'Hii everyone this is a demo of\nflutter twilio sms.');
  }
  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);
    await twilioFlutter.getSMS('***************************');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Test'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Press the button to send SMS.',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}