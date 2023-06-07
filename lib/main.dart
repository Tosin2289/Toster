import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toster/splash.dart';

import 'package:toster/utils.dart';
import 'package:zego_zimkit/services/services.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ZIMKit().init(appID: Utils.id, appSign: Utils.Signin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}
