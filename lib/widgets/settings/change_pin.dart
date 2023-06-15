import 'package:flutter/material.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/widgets/pin_keyboard.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context, listen: false);

    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(48.0),
          child: PinKeyboard(
            onPinEntered: (pin) {
              settings.appLock = LockType.pin;
              settings.pin = pin;
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
