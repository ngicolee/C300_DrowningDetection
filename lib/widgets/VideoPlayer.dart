import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerCustom extends StatefulWidget{
  VideoPlayerCustom({Key? key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerCustom> {
  late VideoPlayerController _controller;
  late Future<void> _video;

  @override
    void initState() {
    super.initState();
    _controller =VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _video = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _video,
          builder: (context,snapshot)
      {
        if(snapshot.connectionState==ConnectionState.done)
          {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          }
        else
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_controller.value.isPlaying) {
            setState(() {
              _controller.pause();
            });
          }
          else{
            setState(() {
              _controller.play();
            });
          }
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),),
    );
  }
}