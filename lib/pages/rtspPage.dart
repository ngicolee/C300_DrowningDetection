// ignore_for_file: prefer_const_constructors, file_names

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({Key? key}) : super(key: key);

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {

  bool _isPlaying = true;

  final VlcPlayerController _videoPlayerController = VlcPlayerController.network(
    'https://media.w3.org/2010/05/sintel/trailer.mp4',
    hwAcc: HwAcc.full,
    autoPlay: false,
    options: VlcPlayerOptions(),
  );




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => MainHomePage(),
                                    ),
                                  );
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
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
            aspectRatio: 16 / 9,
            placeholder: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          //Comment out the whole thing under ROW when using RTSP
          Row(
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
          )
        ],
      ),
    );
  }
}
