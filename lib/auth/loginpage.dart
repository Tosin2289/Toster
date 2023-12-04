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
  static String name = '';
  static String userid = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "TOSTER".toUpperCase(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100.0),
            TextField(
              onChanged: (value) {
                name = value;
              },
              controller: username,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(31.0),
                            bottomLeft: Radius.circular(31.0),
                            topRight: Radius.circular(31.0),
                            bottomRight: Radius.circular(11.0))),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                hintText: "Username",
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              onChanged: (value) {
                userid = value;
              },
              cursorColor: Colors.black,
              controller: userID,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(31.0),
                            bottomLeft: Radius.circular(31.0),
                            topRight: Radius.circular(31.0),
                            bottomRight: Radius.circular(11.0))),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    )),
                hintText: "Number",
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text("Login".toUpperCase()),
                onPressed: () async {
                  CircularProgressIndicator(
                    color: Colors.black,
                  );
                  await ZIMKit()
                      .connectUser(id: userID.text, name: username.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ));
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
