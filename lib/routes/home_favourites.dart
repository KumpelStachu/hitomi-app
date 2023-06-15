import 'package:flutter/material.dart';

class HomeFavourites extends StatelessWidget {
  const HomeFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: const Stack(
        children: [
          Placeholder(),
        ],
      ),
    );
  }
}
