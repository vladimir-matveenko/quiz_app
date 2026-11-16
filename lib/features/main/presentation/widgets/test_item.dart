import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/constants/asset_paths.dart';
import '../../../../core/presentation/widgets/expandable_container.dart';

class TestItem extends StatelessWidget {
  const TestItem({
    super.key,
    required this.title,
    this.onLeftTap,
    this.onRightTap,
  });

  final String title;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  @override
  Widget build(BuildContext context) {
    return ExpandableContainer(
      header: Text(title),
      body: Padding(
        padding: const .all(8.0),
        child: Row(
          spacing: 8.0,
          mainAxisAlignment: .center,
          children: [
            if (onLeftTap != null)
              Expanded(
                child: OutlinedButton(
                  onPressed: onLeftTap,
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 4.0,
                    children: [
                      SvgPicture.asset(AssetPaths.flagUs, height: 20.0),
                      SvgPicture.asset(AssetPaths.flagRu, height: 20.0),
                    ],
                  ),
                ),
              ),
            if (onRightTap != null)
              Expanded(
                child: OutlinedButton(
                  onPressed: onRightTap,
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 4.0,
                    children: [
                      SvgPicture.asset(AssetPaths.flagRu, height: 20.0),
                      SvgPicture.asset(AssetPaths.flagUs, height: 20.0),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
