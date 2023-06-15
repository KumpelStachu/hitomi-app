import 'package:flutter/material.dart';

class PinDigit extends StatelessWidget {
  const PinDigit(this.digit, {super.key});

  final String digit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          digit,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
