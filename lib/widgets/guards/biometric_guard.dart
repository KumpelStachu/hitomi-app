import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricGuard extends StatefulWidget {
  const BiometricGuard(this.onSuccess, {super.key});

  final VoidCallback onSuccess;

  @override
  State<BiometricGuard> createState() => _BiometricGuardState();
}

class _BiometricGuardState extends State<BiometricGuard> {
  @override
  void initState() {
    super.initState();
    _tryBiometric(context);
  }

  Future<void> _tryBiometric(BuildContext context) async {
    final localAuth = LocalAuthentication();

    final authenticated = await localAuth.authenticate(
      localizedReason: 'Authenticate to unlock app',
      options: const AuthenticationOptions(
        biometricOnly: true,
      ),
    );

    if (authenticated && context.mounted) {
      widget.onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App locked'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: FilledButton.icon(
            onPressed: () => _tryBiometric(context),
            icon: const Icon(Icons.fingerprint, size: 48),
            label: const Text(
              'Authenticate',
              style: TextStyle(fontSize: 24),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
