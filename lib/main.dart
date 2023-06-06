import 'package:flutter/material.dart';

import 'package:toster/utils.dart';
import 'package:zego_zimkit/services/services.dart';

import 'auth/loginpage.dart';

void main() {
  ZIMKit().init(appID: Utils.id, appSign: Utils.Signin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
