import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/widgets/settings/change_pin.dart';
import 'package:local_auth/local_auth.dart';

class AppLock extends StatelessWidget {
  const AppLock({super.key});

  showChangePin(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ChangePin(),
      isScrollControlled: true,
    );
  }

  enableBiometric(BuildContext context) async {
    final settings = Settings.of(context, listen: false);
    final localAuth = LocalAuthentication();

    try {
      final result = await localAuth.authenticate(
        localizedReason: 'Authenticate to enable biometric',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      if (result) settings.appLock = LockType.biometric;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? 'Unknown error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return ExpansionTile(
      title: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: settings.appLock == LockType.none
                ? const Icon(Icons.lock_open, key: ValueKey('locked'))
                : const Icon(Icons.lock, key: ValueKey('unlocked')),
          ),
          const Gap(12),
          const Text('App lock'),
        ],
      ),
      children: [
        RadioListTile(
          title: const Text('None'),
          value: LockType.none,
          groupValue: settings.appLock,
          onChanged: (v) => settings.appLock = LockType.none,
        ),
        RadioListTile(
          title: const Text('Pin'),
          value: LockType.pin,
          groupValue: settings.appLock,
          onChanged: (v) => showChangePin(context),
          secondary: settings.appLock == LockType.pin
              ? TextButton(
                  onPressed: () => showChangePin(context),
                  child: const Text('Change pin'),
                )
              : null,
        ),
        RadioListTile(
          title: const Text('Biometric'),
          value: LockType.biometric,
          groupValue: settings.appLock,
          onChanged: Settings.canCheckBiometrics
              ? (_) => enableBiometric(context)
              : null,
        ),
      ],
    );
  }
}
