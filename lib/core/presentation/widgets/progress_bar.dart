import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.maxValue,
    required this.currentValue,
    this.height,
    this.backgroundColor,
    this.barColor,
    this.duration = const Duration(milliseconds: 400),
  });

  final int maxValue;
  final int currentValue;
  final double? height;
  final Color? backgroundColor;
  final Color? barColor;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actualHeight = height ?? 24.0;

    final scale = maxValue > 0
        ? (currentValue / maxValue).clamp(0.0, 1.0)
        : 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            _BarElement(
              color: backgroundColor ?? theme.unselectedWidgetColor,
              width: maxWidth,
              height: actualHeight,
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(end: scale),
              duration: duration,
              curve: Curves.easeOutCubic,
              builder: (context, animatedScale, child) {
                return _BarElement(
                  color: barColor ?? theme.colorScheme.primary,
                  width: maxWidth * animatedScale,
                  height: actualHeight,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _BarElement extends StatelessWidget {
  const _BarElement({
    required this.color,
    required this.width,
    required this.height,
  });

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}
