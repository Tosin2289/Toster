import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/compnents/conversation_list.dart';
import 'package:zego_zimkit/pages/message_list_page.dart';
import 'package:zego_zimkit/services/services.dart';
import 'package:zego_zimkit/utils/dialogs_utils.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final user = ZIMKit().currentUser()!.baseInfo.userName;
  final userid = ZIMKit().currentUser()!.baseInfo.userID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(),
        backgroundColor: Colors.deepPurple[200],
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundColor: Colors.deepPurple[100],
            radius: 30,
            child: Text(
              user[0].toUpperCase(),
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple),
            ),
          ),
        ),
        title: Text(
          "Chats".toUpperCase(),
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                          ZIMKit().showDefaultNewPeerChatDialog(context),
                    )),
                PopupMenuItem(
                    value: "New Group",
                    child: ListTile(
                      leading: const Icon(
                        CupertinoIcons.person_2_fill,
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
                        Icons.group_add,
                      ),
                      title: const Text(
                        "Join Group Chat",
                        maxLines: 1,
                      ),
                      onTap: () => ZIMKit().showDefaultJoinGroupDialog(context),
                    )),
              ];
            },
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple[200],
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ZIMKitMessageListPage(
                conversationID: conversation.id,
                conversationType: conversation.type,
              );
            },
          ));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          ZIMKit().showDefaultNewPeerChatDialog(context);
        },
        label: const Text(
          "New Chat",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
