import 'package:flutter/material.dart';
import 'package:toster/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'dart:math';

import 'package:zego_zimkit/services/services.dart';

class VideocallPage extends StatefulWidget {
  const VideocallPage({Key? key}) : super(key: key);

  @override
  State<VideocallPage> createState() => _VideocallPageState();
}

class _VideocallPageState extends State<VideocallPage> {
  final callidctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.deepPurple[200],
              title: Text(
                "Video call".toUpperCase(),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/video.png",
                        height: 200,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: callidctrl,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16.0),
                                prefixIcon: Container(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 16.0),
                                    margin: const EdgeInsets.only(right: 8.0),
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple.shade100,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                            bottomRight:
                                                Radius.circular(10.0))),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.deepPurple,
                                    )),
                                hintText: "Join a Call By ID",
                                hintStyle:
                                    const TextStyle(color: Colors.white54),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[100],
                              foregroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                            child: Text(
                              "Call".toUpperCase(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CallPage(CallID: callidctrl.text);
                                },
                              ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String CallID;
  const CallPage({Key? key, required this.CallID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
            appID: Utils.id,
            appSign: Utils.Signin,
            callID: CallID,
            userID: ZIMKit().currentUser()!.baseInfo.userName,
            userName: ZIMKit().currentUser()!.baseInfo.userName,
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              ..onOnlySelfInRoom = (context) {
                Navigator.of(context).pop();
              }));
  }
}
