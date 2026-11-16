import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_semantic_colors.dart';

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({super.key, required this.onTap, this.resultsWidget});

  final VoidCallback onTap;
  final Widget? resultsWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final semanticColors = theme.extension<AppSemanticColors>();
    return Center(
      child: Column(
        spacing: 16.0,
        mainAxisAlignment: .center,
        children: [
          Icon(
            Icons.check_circle_outline_outlined,
            size: 80.0,
            color: semanticColors!.success,
          ),
          ?resultsWidget,
          ElevatedButton(
            onPressed: () {
              onTap.call();
              if (context.canPop()) {
                context.pop();
              }
            },
            child: Text('flashcardPage.ready'.tr()),
          ),
        ],
      ),
    );
  }
}
