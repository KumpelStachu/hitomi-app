import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitomi/providers/settings.dart';

class ScrollDirection extends StatefulWidget {
  const ScrollDirection({super.key});

  @override
  State<ScrollDirection> createState() => _ScrollDirectionState();
}

class _ScrollDirectionState extends State<ScrollDirection> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return SwitchListTile(
      title: Row(
        children: [
          AnimatedRotation(
            turns: _turns,
            duration: const Duration(milliseconds: 200),
            child: const Icon(Icons.keyboard_double_arrow_right_outlined),
          ),
          const Gap(12),
          const Text('Reverse scroll direction'),
        ],
      ),
      value: settings.reverseScroll,
      onChanged: (v) {
        settings.reverseScroll = v;
        setState(() {
          _turns += .5;
        });
      },
    );
  }
}
