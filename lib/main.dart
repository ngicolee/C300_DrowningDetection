// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers, unused_local_variable

// import 'package:c300drowningdetection/pages/mainwelcomepage.dart';
//import 'package:c300drowningdetection/pages/mainwelcomepage.dart';

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/models/mqt_model.dart';

import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:c300drowningdetection/pages/testsplashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'provider/page_provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDatabase database = FirebaseDatabase.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _service = MQTTService(
    //   // Host IP Address (?)
    //   host: 'test.mosquitto.org',
    //   port: 1883,
    //   topic: 'MQTT_Drowning',
    //   model: MQTTModel(),
    // );
    // _service.initializeMQTTClient;
    // _service.connectMQTT;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider<MQTTModel>(
          create: (context) => MQTTModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.MAIN_COLOR,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TestSplashScreen();
            } else {
              return MainLoginPage();
            }
          },
        ),
        localizationsDelegates: const [
          MonthYearPickerLocalizations.delegate,
        ],
      ),
    );
  }
}
