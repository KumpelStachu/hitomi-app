import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitomi/providers/settings.dart';

class ChangeIcon extends StatelessWidget {
  const ChangeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return ExpansionTile(
      title: const Row(
        children: [
          Icon(Icons.app_shortcut),
          Gap(12),
          Text('Change icon'),
        ],
      ),
      children: [
        ListTile(
          title: const Text('Default'),
          leading: const Icon(Icons.insert_emoticon),
          onTap: () => settings.icon = 'default',
          selected: settings.icon == 'default',
        ),
        ListTile(
          title: const Text('Stealth'),
          leading: const Icon(Icons.gpp_good),
          onTap: () => settings.icon = 'stealth',
          selected: settings.icon == 'stealth',
        ),
      ],
    );
  }
}
