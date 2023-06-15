import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader(this.progress, {super.key, this.compact = false});

  final double? progress;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return ColoredBox(
      color: scheme.secondaryContainer.withAlpha(255 ~/ 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            color: scheme.onSecondaryContainer,
            strokeWidth: compact ? 2 : 4,
          ),
          if (progress != null) SizedBox(height: compact ? 2 : 4),
          if (progress != null)
            Text(
              '${compact ? '' : 'Loading image\n'}${(progress! * 100).toStringAsFixed(1)} %',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: scheme.onSecondaryContainer,
                fontSize: compact ? 12 : null,
              ),
            ),
        ],
      ),
    );
  }
}
