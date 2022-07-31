// ignore_for_file: prefer_const_constructors, file_names

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({Key? key}) : super(key: key);

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

void deviceOrientation() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  String userRights = "Guest";

  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    DrownCheck().drownCheck();
  }
  //bool _isPlaying = true;

  final VlcPlayerController _videoPlayerController =
      VlcPlayerController.network(
    'rtsp://10.13.12.65:5540/ch0',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );
  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();

    setState(() {
      userRights = snap["userRights"];
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceOrientation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "LiveStream Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (userRights == "Admin") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => MainHomePage(),
                  ),
                );
              } else if (userRights == "Guest") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => GuestHomePage(),
                  ),
                );
              }
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 26 / 9,
            placeholder: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          //Comment out the whole thing under ROW when using RTSP
          /*Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.fast_rewind,
                  size: 28,
                  color: Colors.black,
                ),
              ),

              TextButton(
                onPressed: () {
                  if(_isPlaying){
                    setState(() {
                      _isPlaying = false;
                    });
                     _videoPlayerController.pause();
                  }
                  else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _videoPlayerController.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 28,
                  color: Colors.black,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.fast_forward,
                  size: 28,
                  color: Colors.black,
                ),
              ),

            ],
          )*/
        ],
      ),
    );
  }
}
