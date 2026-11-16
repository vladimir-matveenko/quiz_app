import 'dart:math';

import 'package:material_ui/material_ui.dart';

class SmoothFlipCard extends StatefulWidget {
  const SmoothFlipCard({super.key, required this.front, required this.back});

  final Widget Function(VoidCallback) front;
  final Widget Function(VoidCallback) back;

  @override
  State<SmoothFlipCard> createState() => _SmoothFlipCardState();
}

class _SmoothFlipCardState extends State<SmoothFlipCard> {
  bool isFront = true;

  void _flipCard() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 600),
        tween: Tween(begin: 0, end: isFront ? 0 : 1),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          final angle = value * pi;
          // If angle > 90, back is shown
          final showFront = angle <= pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: showFront
                ? Opacity(
                    opacity: 1 - value * 2, // front is hiding
                    child: _buildFront(),
                  )
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: Opacity(
                      opacity: (value - 0.5) * 2, // smooth back appearing
                      child: _buildBack(),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return widget.front(_flipCard);
  }

  Widget _buildBack() {
    return widget.back(_flipCard);
  }
}
