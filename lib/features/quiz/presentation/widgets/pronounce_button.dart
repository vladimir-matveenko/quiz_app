import 'package:material_ui/material_ui.dart';

import '../../../../core/utils/extensions.dart';

class PronounceButton extends StatelessWidget {
  const PronounceButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: theme.isDark
            ? Colors.grey.shade800
            : Colors.grey.shade400,
      ),
      onPressed: onTap,
      icon: const Icon(Icons.mic),
    );
  }
}
