import 'package:flutter/material.dart';

import 'auth/loginpage.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3500), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((Context) {
      return const LoginPage();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "TOSTER".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ShaderMask(
              shaderCallback: (bounds) =>
                  const LinearGradient(colors: [Colors.white, Colors.black])
                      .createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: const Text(
                "MADE BY PHENOMES",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
