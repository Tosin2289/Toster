import 'package:flutter/material.dart';
import 'package:zego_zimkit/services/services.dart';

import '../pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userID = TextEditingController();
  final username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.lightGreen, Colors.green])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "TOSTER".toUpperCase(),
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100.0),
            TextField(
              controller: username,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0))),
                    child: const Icon(
                      Icons.person,
                      color: Colors.lightGreen,
                    )),
                hintText: "Username",
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              cursorColor: Colors.white,
              controller: userID,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0))),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.lightGreen,
                    )),
                hintText: "User ID",
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightGreen,
                  padding: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text("Login".toUpperCase()),
                onPressed: () async {
                  await ZIMKit()
                      .connectUser(id: userID.text, name: username.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
