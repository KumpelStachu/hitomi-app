import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitomi/providers/settings.dart';

class BlurThumbnails extends StatelessWidget {
  const BlurThumbnails({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return SwitchListTile(
      title: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => SizeTransition(
              sizeFactor: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
            child: settings.blurThumbnails
                ? const Icon(Icons.blur_on, key: ValueKey('on'))
                : const Icon(Icons.blur_off, key: ValueKey('off')),
          ),
          const Gap(12),
          const Text('Blur thumbnails'),
        ],
      ),
      value: settings.blurThumbnails,
      onChanged: (v) => settings.blurThumbnails = v,
    );
  }
}
