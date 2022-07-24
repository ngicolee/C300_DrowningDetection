import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:c300drowningdetection/sliders/SampleVideo1.dart';
import 'package:c300drowningdetection/sliders/SampleVideo2.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatefulWidget {
  VideoDemo() : super();

  final String title = "Video Demo";
  @override
  _VideoDemoState createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/videos/video5.mp4");
    _initializeVideoPlayerFuture = _controller.initialize().then((value) => _controller.play());
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          }
          else {
            return
                Center(
                  child: CircularProgressIndicator(),
                );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying) {
              _controller.pause();
            }
            else{
              _controller.play();
            }
          });
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause: Icons.play_arrow),
      ),
    );
  }
}
