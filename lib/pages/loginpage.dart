// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:c300drowningdetection/colorpalette.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: const [Colors.black, Colors.transparent],
        ).createShader(rect),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/Background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        )),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Flexible(
              child: Text(
                'Login Screen',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[500]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Username')))
          ]))
    ]);
  }
}
