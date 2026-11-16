import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import 'level_indicator.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.image,
    required this.title,
    required this.level,
    required this.phraseCount,
    required this.onTap,
  });

  final String image;
  final String title;
  final int level;
  final int phraseCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white24.withValues(alpha: 0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      LevelIndicator(level: level),
                      Text(
                        'textCatalogPage.phrases'.plural(phraseCount),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
