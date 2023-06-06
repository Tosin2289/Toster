import 'package:flutter/material.dart';
import 'package:toster/pages/streampage.dart';
import 'package:toster/pages/videocall_page.dart';
import 'package:toster/pages/voicecall_page.dart';

import '../componets/bottom_nav_bar.dart';
import 'chatpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

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
      currentindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[currentindex],
        bottomNavigationBar: MyBottomNavBar(
          onTap: currentPage,
          currentIndex: currentindex,
        ));
  }
}
