import 'package:material_ui/material_ui.dart';

class OneValueSlider extends StatefulWidget {
  const OneValueSlider({
    super.key,
    this.initValue,
    this.isActive = true,
    required this.onChanged,
  });

  final int? initValue;
  final bool isActive;
  final Function(int) onChanged;

  @override
  State<OneValueSlider> createState() => _OneValueSliderState();
}

class _OneValueSliderState extends State<OneValueSlider> {
  final _minValue = 10.0;
  final _maxValue = 50.0;
  final _step = 5.0;
  double _currentValue = 10;

  @override
  void initState() {
    _currentValue = (widget.initValue?.toDouble() ?? 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.bodySmall;
    return Column(
      spacing: 8.0,
      children: [
        Slider(
          value: _currentValue,
          max: _maxValue,
          min: _minValue,
          divisions: ((_maxValue - _minValue) / _step).round(),
          label: _currentValue.round().toString(),
          onChanged: widget.isActive
              ? (value) {
                  setState(() {
                    _currentValue = value;
                    widget.onChanged(value.toInt());
                  });
                }
              : null,
        ),
        Padding(
          padding: const .symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(_minValue.round().toString(), style: labelStyle),
              Text(
                _currentValue.round().toString(),
                style: labelStyle?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(_maxValue.round().toString(), style: labelStyle),
            ],
          ),
        ),
      ],
    );
  }
}
