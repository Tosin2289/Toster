import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text("Stream"),
              actions: const [Icon(Icons.search), Icon(Icons.more_vert)],
            )
          ],
        ),
      ),
    );
  }
}
