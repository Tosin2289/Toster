import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toster/pages/streampage.dart';
import 'package:toster/pages/videocall_page.dart';
import 'package:toster/pages/voicecall_page.dart';

import 'chatpage.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List pages = const [
    ChatPage(),
    VideocallPage(),
    VoiceCallPage(),
    StreamPage()
  ];
  int currentindex = 0;
  void currentPage(int value) {
    setState(() {
      value = currentindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[currentindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            height: 150,
            color: Colors.transparent,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.03),
                          ]),
                      border:
                          Border.all(color: Colors.white.withOpacity(0.13))),
                ),
                BottomNavigationBar(
                    onTap: currentPage,
                    currentIndex: currentindex,
                    backgroundColor: Colors.transparent,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.chat), label: 'chat'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.video_call), label: 'Video Call'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.call), label: 'Voice Call'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.stream_outlined), label: 'Stream'),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
