// ignore_for_file: annotate_overrides, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, use_build_context_synchronously, avoid_print, unnecessary_brace_in_string_interps, unused_field, unrelated_type_equality_checks, unused_element, unnecessary_string_interpolations

import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/pages/mainloginpage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:mqtt_client/mqtt_client.dart' as mqtt;

class TestSplashScreen extends StatefulWidget {
  const TestSplashScreen({Key? key}) : super(key: key);

  @override
  State<TestSplashScreen> createState() => _TestSplashScreenState();
}

class _TestSplashScreenState extends State<TestSplashScreen> {
  // String broker = 'test.mosquitto.org';
  // int port = 1883;
  // String clientIdentifier = 'DeepStreamApp';
  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  String userRights = "Guest";
  String token = " ";

  // mqtt.MqttClient? client;
  // mqtt.MqttConnectionState? connectionState;

  // int _drowningDetection = 0;

  // StreamSubscription? subscription;

  // void _subscribeToTopic(String topic) {
  //   if (connectionState == mqtt.MqttConnectionState.connected) {
  //     print('[MQTT client] Subscribing to ${topic.trim()}');
  //     client?.subscribe(topic, mqtt.MqttQos.exactlyOnce);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _checkRole();
    loadFirebaseMessaging();
    listenFirebaseMessaging();
    getToken();
    DrownCheck().drownCheck;
    FirebaseMessaging.instance.subscribeToTopic("Drowning");
  }

  void listenFirebaseMessaging() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,

              // ignore: todo
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  void loadFirebaseMessaging() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
          'high_importance_channel', // id
          'High Importance Notifications', // title
          importance: Importance.high,
          enableVibration: true,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('mixkit-siren-tone-1649'));

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        token = token;
      });
    });
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();

    setState(() {
      userRights = snap["userRights"];
    });

    void verifyEmail() async {
      User? user = FirebaseAuth.instance.currentUser;
      if (!(user!.emailVerified)) {
        user.sendEmailVerification();
      }
    }

    if (!(user!.emailVerified)) {
      user.sendEmailVerification();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => new MainLoginPage(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Email not verified. Please verify your email address!"),
        ),
      );
    } else {
      if (userRights == "Guest") {
        verifyEmail();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => new GuestHomePage(),
          ),
        );
      } else if (userRights == "Admin") {
        verifyEmail();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => new MainHomePage(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => new MainLoginPage(),
          ),
        );
      }
    }
  }

  void navigateNext(Widget route) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => route));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }

  // void _connect() async {
  //   client = mqtt.MqttClient(broker, '');
  //   client?.port = port;

  //   client?.logging(on: true);

  //   client?.onDisconnected = _onDisconnected;

  //   final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
  //       .withClientIdentifier(clientIdentifier)
  //       .startClean() // Non persistent session for testing
  //       .withWillQos(mqtt.MqttQos.atMostOnce);
  //   print('[MQTT client] MQTT client connecting....');
  //   client?.connectionMessage = connMess;

  //   try {
  //     await client?.connect();
  //   } catch (e) {
  //     print(e);
  //     _disconnect();
  //   }

  //   /// Check if we are connected
  //   if (client?.connectionStatus == mqtt.MqttConnectionState.connected) {
  //     print('[MQTT client] connected');
  //     setState(() {
  //       connectionState = client?.connectionState;
  //     });
  //   } else {
  //     print('[MQTT client] ERROR: MQTT client connection failed - '
  //         'disconnecting, state is ${client?.connectionStatus}');
  //     _disconnect();
  //   }

  //   subscription = client?.updates?.listen(_onMessage);

  //   _subscribeToTopic("drowningDetection");
  // }

  // void _disconnect() {
  //   print('[MQTT client] _disconnect()');
  //   client?.disconnect();
  //   _onDisconnected();
  // }

  // void _onDisconnected() {
  //   print('[MQTT client] _onDisconnected');
  //   setState(() {
  //     //topics.clear();
  //     connectionState = client?.connectionState;
  //     client = null;
  //     subscription?.cancel();
  //     subscription = null;
  //   });
  //   print('[MQTT client] MQTT client disconnected');
  // }

  // void _onMessage(List<mqtt.MqttReceivedMessage> event) {
  //   print(event.length);
  //   final mqtt.MqttPublishMessage recMess =
  //       event[0].payload as mqtt.MqttPublishMessage;
  //   final String message =
  //       mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

  //   print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
  //       'payload is <-- ${message} -->');
  //   print(client?.connectionStatus);
  //   print("[MQTT client] message with topic: ${event[0].topic}");
  //   print("[MQTT client] message with message: ${message}");
  //   setState(() {
  //     _drowningDetection = int.parse(message);
  //   });
  // }
}
