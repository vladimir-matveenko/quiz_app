import 'package:material_ui/material_ui.dart';

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({
    super.key,
    required this.header,
    required this.body,
  });

  final Widget header;
  final Widget body;

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  final _controller = ExpansibleController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(width: 2.0, color: theme.colorScheme.primary),
      ),
      child: Expansible(
        headerBuilder: (context, animation) {
          return GestureDetector(
            onTap: () {
              if (_controller.isExpanded) {
                _controller.collapse();
              } else {
                _controller.expand();
              }
            },
            child: ListTile(
              title: widget.header,
              trailing: RotationTransition(
                turns: Tween<double>(begin: 0.0, end: 0.5).animate(animation),
                child: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
            ),
          );
        },
        bodyBuilder: (context, animation) =>
            SizeTransition(sizeFactor: animation, child: widget.body),
        expansibleBuilder: (context, header, body, animation) => Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [header, body],
        ),
        controller: _controller,
      ),
    );
  }
}
