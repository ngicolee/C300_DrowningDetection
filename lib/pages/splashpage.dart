import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({Key? key, required this.goToPage, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });
    return Scaffold(
        body: Container(
            color: const Color.fromARGB(255, 0, 183, 255),
            alignment: Alignment.center,
            child:
                const Icon(Icons.pool_sharp, color: Colors.white, size: 200)));
  }
}
