import 'dart:ui';

import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTap;
  final int currentIndex;
  const MyBottomNavBar(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 100,
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
                          Colors.white.withOpacity(0.10),
                        ]),
                    border: Border.all(color: Colors.white.withOpacity(0.18))),
              ),
              Center(
                child: BottomNavigationBar(
                    elevation: 0,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.black,
                    onTap: onTap,
                    currentIndex: currentIndex,
                    backgroundColor: Colors.transparent,
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Image.asset(
                            "assets/bubble-chat.png",
                            height: 40,
                          ),
                          label: 'chat'),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Image.asset(
                            "assets/video.png",
                            height: 40,
                          ),
                          label: 'Video Call'),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Image.asset(
                            "assets/voice-message.png",
                            height: 40,
                          ),
                          label: 'Voice Call'),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Image.asset(
                            "assets/radio.png",
                            height: 40,
                          ),
                          label: 'Stream'),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
