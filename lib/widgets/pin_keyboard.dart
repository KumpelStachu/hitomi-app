import 'package:flutter/material.dart';
import 'package:hitomi/widgets/pin_digit.dart';

class PinKeyboard extends StatefulWidget {
  const PinKeyboard({
    super.key,
    this.pinLength = 4,
    required this.onPinEntered,
  });

  final int pinLength;
  final void Function(String pin) onPinEntered;

  @override
  State<PinKeyboard> createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  var _pin = '';

  void _addDigit(String digit) {
    setState(() {
      if (_pin.length < widget.pinLength) {
        _pin += digit;
      }
    });
    if (_pin.length == widget.pinLength) {
      widget.onPinEntered(_pin);
    }
  }

  void _removeDigit() {
    setState(() {
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < widget.pinLength; i++)
                PinDigit(_pin.length > i ? _pin[i] : ''),
            ],
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          children: [
            for (var i = 1; i <= 9; i++)
              FilledButton.tonal(
                onPressed: () => _addDigit(i.toString()),
                child: Text(
                  i.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            const SizedBox(),
            FilledButton.tonal(
              onPressed: () => _addDigit('0'),
              child: Text(
                '0',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            FilledButton(
              onPressed: _removeDigit,
              child: const Icon(
                Icons.backspace,
                size: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
