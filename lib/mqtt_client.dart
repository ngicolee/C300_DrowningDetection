// // ignore_for_file: avoid_print

// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';
// import 'dart:io';

// Future<MqttClient> connect() async {
//   MqttServerClient client =
//       MqttServerClient.withPort('broker.mqttdashboard.com', 'clientId-ur9ULKuJSk', 8000);
//   client.logging(on: true);
//   client.onConnected = onConnected;
//   client.onDisconnected = onDisconnected;
//   client.onUnsubscribed = onUnsubscribed as UnsubscribeCallback?;
//   client.onSubscribed = onSubscribed;
//   client.onSubscribeFail = onSubscribeFail;
//   client.pongCallback = pong;

//   final connMess = MqttConnectMessage()
//       .withClientIdentifier("clientId-ur9ULKuJSk")
//       .authenticateAs("test", "test")
//       .withWillTopic('willtopic')
//       .withWillMessage('My Will message')
//       .startClean()
//       .withWillQos(MqttQos.atLeastOnce);
//   client.connectionMessage = connMess;
//   try {
//     print('Connecting');
//     await client.connect();
//   } catch (e) {
//     print('Exception: $e');
//     client.disconnect();
//   }

//   if (client.connectionStatus!.state == MqttConnectionState.connected) {
//     print('Client connected');
//     client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       print('Received message:$payload from topic: ${c[0].topic}>');
//     });

//     client.published!.listen((MqttPublishMessage message) {
//       print('published');
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);
//       print(
//           'Published message: $payload to topic: ${message.variableHeader!.topicName}');
//     });
//   } else {
//     print(
//         'EMQX client connection failed - disconnecting, status is ${client.connectionStatus}');
//     client.disconnect();
//     exit(-1);
//   }

//   return client;
// }

// void onConnected() {
//   print('Connected');
// }

// void onDisconnected() {
//   print('Disconnected');
// }

// void onSubscribed(String topic) {
//   print('Subscribed topic: $topic');
// }

// void onSubscribeFail(String topic) {
//   print('Failed to subscribe topic: $topic');
// }

// void onUnsubscribed(String topic) {
//   print('Unsubscribed topic: $topic');
// }

// void pong() {
//   print('Ping response client callback invoked');
// }
