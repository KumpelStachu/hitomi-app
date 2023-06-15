import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LockType { none, pin, biometric }

class Settings extends ChangeNotifier {
  static late final SharedPreferences _prefs;
  static late final bool canCheckBiometrics;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
    canCheckBiometrics = await LocalAuthentication().canCheckBiometrics;
  }

  static Settings of(BuildContext context, {bool listen = true}) =>
      Provider.of<Settings>(context, listen: listen);

  String get icon => _prefs.getString('icon') ?? 'default';
  set icon(String? value) {
    _prefs.setString('icon', value!);
    notifyListeners();
  }

  bool get blurThumbnails => _prefs.getBool('blurThumbnails') ?? false;
  set blurThumbnails(bool value) {
    _prefs.setBool('blurThumbnails', value);
    notifyListeners();
  }

  LockType get appLock {
    final lock = _prefs.getString('appLock');

    if (lock == null) return LockType.none;
    final type = LockType.values.firstWhere((e) => e.toString() == lock);

    return type == LockType.biometric && !canCheckBiometrics
        ? LockType.none
        : type;
  }

  set appLock(LockType? value) {
    _prefs.setString(
      'appLock',
      value == LockType.biometric && !canCheckBiometrics
          ? LockType.none.toString()
          : value.toString(),
    );
    notifyListeners();
  }

  String? get pin => _prefs.getString('pin');
  set pin(String? value) {
    _prefs.setString('pin', value!);
    notifyListeners();
  }

  bool get reverseScroll => _prefs.getBool('reverseScroll') ?? false;
  set reverseScroll(bool value) {
    _prefs.setBool('reverseScroll', value);
    notifyListeners();
  }

  int get preloadOffset => _prefs.getInt('preloadOffset') ?? 2;
  set preloadOffset(int value) {
    _prefs.setInt('preloadOffset', value);
    notifyListeners();
  }
}
