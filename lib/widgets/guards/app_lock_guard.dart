import 'package:flutter/material.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/widgets/guards/biometric_guard.dart';
import 'package:hitomi/widgets/guards/pin_guard.dart';

class AppLockGuard extends StatefulWidget {
  const AppLockGuard({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget? child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<AppLockGuard> createState() => _AppLockGuardState();
}

class _AppLockGuardState extends State<AppLockGuard>
    with WidgetsBindingObserver {
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _lockApp());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) _lockApp();
  }

  void _onSuccess() {
    setState(() {
      _isLocked = false;
    });
    widget.navigatorKey.currentState!.pop();
  }

  void _lockApp() {
    final settings = Settings.of(context, listen: false);

    if (settings.appLock == LockType.none || _isLocked) return;

    setState(() {
      _isLocked = true;
    });

    widget.navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: settings.appLock == LockType.pin
              ? PinGuard(_onSuccess)
              : BiometricGuard(_onSuccess),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}
