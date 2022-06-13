// ignore_for_file: use_key_in_widget_constructors

import 'package:c300drowningdetection/pages/loginpage.dart';
import 'package:c300drowningdetection/pages/registrationpage.dart';
import 'package:c300drowningdetection/pages/rtspPage.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child:
                  Image.asset('assets/imgs/Background.jpg', fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                        width: 180,
                        height: 180,
                        color: const Color.fromARGB(255, 0, 183, 255)
                            .withOpacity(0.5),
                        alignment: Alignment.center,
                        child: const Icon(Icons.pool_sharp,
                            color: Colors.white, size: 130)),
                  ),
                  const SizedBox(height: 30),
                  const Text('Drowning Detection',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  const Text(
                      'C300 FYP Project \n Members: Nicole, Nicolette, Yuan Wei, Dexter',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 183, 255)
                              .withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 4),
                          minimumSize: const Size(350, 20)),
                      icon: const Icon(Icons.home_filled,
                          size: 32, color: Colors.white),
                      label: buildText('Homepage'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveStreamScreen()));
                      }),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 183, 255)
                              .withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 4),
                          minimumSize: const Size(350, 20)),
                      icon: const Icon(Icons.login_outlined,
                          size: 32, color: Colors.white),
                      label: buildText('Registration'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      }),
                  const SizedBox(height: 4),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 183, 255)
                              .withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 4),
                          minimumSize: const Size(350, 20)),
                      icon: const Icon(Icons.app_registration_outlined,
                          size: 32, color: Colors.white),
                      label: buildText('Login to System'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                ]),
          ),
        ]),
      ),
    );
  }
}

// Button Test Builder
Text buildText(String text) => Text(text, style: const TextStyle(fontSize: 28));
