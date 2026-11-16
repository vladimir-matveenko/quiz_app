import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_semantic_colors.dart';

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({super.key, required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    final inactiveColor = Theme.of(context).unselectedWidgetColor;
    final activeColor = getLevelColor(context, level: level);
    return SizedBox(
      height: 16,
      width: 26,
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: List.generate(
          3,
          (index) => ColoredBox(
            color: (index + 1) <= level ? activeColor : inactiveColor,
            child: const SizedBox(width: 6, height: double.infinity),
          ),
        ),
      ),
    );
  }
}

class LevelItem extends StatelessWidget {
  const LevelItem({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: const SizedBox(width: 6, height: double.infinity),
    );
  }
}

Color getLevelColor(BuildContext context, {required int level}) {
  final theme = Theme.of(context);
  final semanticColors = theme.extension<AppSemanticColors>();
  return switch (level) {
    1 => semanticColors!.success,
    2 => Colors.yellow,
    3 => theme.colorScheme.error,
    _ => theme.unselectedWidgetColor,
  };
}
