import 'package:flutter/material.dart';

class VoiceCallPage extends StatelessWidget {
  const VoiceCallPage({Key? key}) : super(key: key);

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
                "Voice Call".toUpperCase(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              actions: const [Icon(Icons.search), Icon(Icons.more_vert)],
            )
          ],
        ),
      ),
    );
  }
}
