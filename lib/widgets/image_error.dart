import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: scheme.errorContainer.withAlpha(255 ~/ 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: compact ? 24 : 32,
            color: scheme.onErrorContainer,
          ),
          const SizedBox(height: 4),
          Text(
            'Failed to \n load image',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: scheme.onErrorContainer,
                  fontSize: compact ? 12 : null,
                ),
          ),
        ],
      ),
    );
  }
}
