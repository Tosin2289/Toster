import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
              title: const Text("Chats"),
              actions: const [Icon(Icons.search), Icon(Icons.more_vert)],
            )
          ],
        ),
      ),
    );
  }
}
