import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitomi/providers/settings.dart';

class PreloadOffset extends StatelessWidget {
  const PreloadOffset({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return ExpansionTile(
      title: const Row(
        children: [
          Icon(Icons.image_outlined),
          Gap(12),
          Text('Preload images'),
        ],
      ),
      children: [
        for (var i = 2; i <= 7; i++)
          RadioListTile(
            title: Text('$i page${i > 1 ? 's' : ''}'),
            value: i,
            groupValue: settings.preloadOffset,
            onChanged: (value) => settings.preloadOffset = value ?? 1,
          ),
      ],
    );
  }
}
