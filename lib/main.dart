import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      // Home of MaterialApp
      home: SplashPage(duration: 3, goToPage: const WelcomePage())));
}

// Splash Page StatelessWidget
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

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.3,
            child: Image.asset('assets/imgs/Background.jpg', fit: BoxFit.cover),
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
                      color: const Color.fromARGB(255, 0, 183, 255),
                      alignment: Alignment.center,
                      child: const Icon(Icons.pool_sharp,
                          color: Colors.white, size: 130)),
                ),
                const SizedBox(height: 50),
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
                        primary: const Color.fromARGB(255, 0, 183, 255),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        minimumSize: const Size(350, 20)),
                    icon: const Icon(Icons.login_outlined,
                        size: 32, color: Colors.white),
                    label: buildText('Login to System'),
                    onPressed: () {}),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 183, 255),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        minimumSize: const Size(350, 20)),
                    icon: const Icon(Icons.app_registration_outlined,
                        size: 32, color: Colors.white),
                    label: buildText('Registration'),
                    onPressed: () {})
              ]),
        )
      ]),
    ));
  }
}

// Button Test Builder
Text buildText(String text) => Text(text, style: const TextStyle(fontSize: 28));
