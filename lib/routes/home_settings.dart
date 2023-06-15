import 'package:flutter/material.dart';
import 'package:hitomi/widgets/settings/app_lock.dart';
import 'package:hitomi/widgets/settings/blur_thubnails.dart';
import 'package:hitomi/widgets/settings/change_icon.dart';
import 'package:hitomi/widgets/settings/preload_offset.dart';
import 'package:hitomi/widgets/settings/scroll_direction.dart';

class HomeSettings extends StatelessWidget {
  const HomeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => showLicensePage(context: context),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ChangeIcon(),
          AppLock(),
          BlurThumbnails(),
          ScrollDirection(),
          PreloadOffset(),
        ],
      ),
    );
  }
}
