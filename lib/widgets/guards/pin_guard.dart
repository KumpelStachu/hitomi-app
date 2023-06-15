import 'package:flutter/material.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/widgets/pin_keyboard.dart';

class PinGuard extends StatelessWidget {
  const PinGuard(this.onSuccess, {super.key});

  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App locked'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinKeyboard(
              onPinEntered: (pin) {
                if (settings.pin == pin) {
                  onSuccess();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid PIN'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
