import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/services/services.dart';
import 'package:zego_zimkit/utils/dialogs_utils.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              leading: const CircleAvatar(
                radius: 100,
              ),
              title: Text(
                "Chats".toUpperCase(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              actions: [
                PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          value: "New Chat",
                          child: ListTile(
                            leading: const Icon(
                              CupertinoIcons.chat_bubble_2,
                            ),
                            title: const Text(
                              "New Chat",
                              maxLines: 1,
                            ),
                            onTap: () =>
                                ZIMKit().showDefaultNewGroupChatDialog(context),
                          )),
                      PopupMenuItem(
                          value: "New Group",
                          child: ListTile(
                            leading: const Icon(
                              CupertinoIcons.chat_bubble_2,
                            ),
                            title: const Text(
                              "New Group Chat",
                              maxLines: 1,
                            ),
                            onTap: () =>
                                ZIMKit().showDefaultNewGroupChatDialog(context),
                          )),
                      PopupMenuItem(
                          value: "Join Group",
                          child: ListTile(
                            leading: const Icon(
                              CupertinoIcons.chat_bubble_2,
                            ),
                            title: const Text(
                              "Join Group Chat",
                              maxLines: 1,
                            ),
                            onTap: () =>
                                ZIMKit().showDefaultJoinGroupDialog(context),
                          )),
                    ];
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
