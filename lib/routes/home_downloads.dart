import 'package:flutter/material.dart';

class HomeDownloads extends StatelessWidget {
  const HomeDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      body: const Stack(
        children: [
          Placeholder(),
        ],
      ),
    );
  }
}
