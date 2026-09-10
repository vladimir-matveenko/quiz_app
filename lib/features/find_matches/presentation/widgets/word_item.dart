import 'package:flutter/material.dart';

import '../../../../app/theme/app_semantic_colors.dart';

class WordItem extends StatefulWidget {
  const WordItem({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.isAnswered = false,
    this.isCorrect = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isAnswered;
  final bool isCorrect;

  @override
  State<WordItem> createState() => _WordItemState();
}

class _WordItemState extends State<WordItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;

  bool get _shouldAnimate =>
      widget.isSelected && widget.isAnswered && widget.isCorrect;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _rotation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.035), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.035, end: 0.035), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.035, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant WordItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_shouldAnimate && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!_shouldAnimate && _controller.isAnimating) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final semanticColors = theme.extension<AppSemanticColors>();

    var color = theme.unselectedWidgetColor;

    if (widget.isSelected) {
      color = theme.colorScheme.primary;

      if (widget.isAnswered) {
        if (widget.isCorrect) {
          color = semanticColors!.success;
        } else {
          color = theme.colorScheme.error;
        }
      }
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          return Transform.rotate(angle: _rotation.value, child: child);
        },
        child: Container(
          padding: const .all(8.0),
          decoration: BoxDecoration(
            borderRadius: .circular(12.0),
            border: .all(color: color, width: 2.0),
          ),
          child: Text(
            widget.text,
            style: theme.textTheme.bodyMedium,
            textAlign: .center,
          ),
        ),
      ),
    );
  }
}
