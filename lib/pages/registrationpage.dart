// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
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
      )
    ]);
  }
}
