import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/core/utils/extensions.dart';

class AppCalendar extends StatefulWidget {
  const AppCalendar({
    super.key,
    this.specialDays = const [],
    this.specialDaysText,
    required this.onMonthChanged,
  });

  final List<DateTime> specialDays;
  final String? specialDaysText;
  final Function(DateTime) onMonthChanged;

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  DateTime _currentDate = DateTime.now();
  late Locale _locale;
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Theme.of(context);
    _locale = context.locale;
  }

  bool _isSpecialDay(DateTime date) {
    return widget.specialDays.any(
      (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );
  }

  void _changeMonth(int offset) {
    setState(() {
      _currentDate = DateTime(
        _currentDate.year,
        _currentDate.month + offset,
        1,
      );
    });
    widget.onMonthChanged(_currentDate);
  }

  List<String> _buildWeekDays() {
    final dateFormat = DateFormat.E(_locale.toString());

    // monday as a date
    final base = DateTime(2024, 1, 1); // monday
    return List.generate(7, (i) {
      final day = base.add(Duration(days: i));
      return dateFormat.format(day);
    });
  }

  List<Widget> _buildCalendar() {
    List<Widget> days = [];

    final firstDay = DateTime(_currentDate.year, _currentDate.month, 1);
    final totalDays = DateTime(
      _currentDate.year,
      _currentDate.month + 1,
      0,
    ).day;

    // normalize monday as a start
    int startWeekday = firstDay.weekday; // Mon = 1

    for (int i = 1; i < startWeekday; i++) {
      days.add(const SizedBox());
    }

    for (int i = 1; i <= totalDays; i++) {
      final date = DateTime(_currentDate.year, _currentDate.month, i);
      final isSpecialDay = _isSpecialDay(date);
      final trainingsCount = widget.specialDays
          .where((e) => e.isSameDay(date))
          .toList()
          .length;

      final formattedDate = DateFormat('dd.MM.yyyy').format(date);
      final tooltipMessage =
          '$formattedDate\n${'historyPage.trainings'.plural(trainingsCount)}';

      days.add(
        _buildDayCell(
          i,
          isSpecial: isSpecialDay,
          tooltipMessage: isSpecialDay ? tooltipMessage : null,
        ),
      );
    }

    return days;
  }

  Widget _buildDayCell(
    int day, {
    bool isSpecial = false,
    String? tooltipMessage,
  }) {
    final child = Container(
      alignment: Alignment.center,
      color: _theme.cardTheme.color,
      child: Text(
        '$day',
        textAlign: .center,
        style: _theme.textTheme.bodySmall?.copyWith(
          color: isSpecial
              ? _theme.colorScheme.error
              : _theme.colorScheme.primary,
          fontWeight: isSpecial ? FontWeight.w600 : null,
        ),
      ),
    );

    if (tooltipMessage == null) return child;

    return Tooltip(
      message: tooltipMessage,
      triggerMode: TooltipTriggerMode.tap,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = _buildWeekDays();
    final calendar = _buildCalendar();

    return Column(
      mainAxisSize: .min,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: () => _changeMonth(-1),
            ),
            Row(
              spacing: 4.0,
              children: [
                Text(
                  DateFormat('MMMM', _locale.toString()).format(_currentDate),
                  style: _theme.textTheme.titleLarge,
                ),
                Text(
                  DateFormat('yyyy', _locale.toString()).format(_currentDate),
                  style: _theme.textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: () => _changeMonth(1),
            ),
          ],
        ),

        /// WEEK DAYS
        Row(
          spacing: 1.0,
          children: weekDays
              .map(
                (d) => Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: _theme.cardTheme.color,
                    child: Text(d, style: _theme.textTheme.bodyLarge),
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 4.0),

        /// GRID
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 7,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          physics: const NeverScrollableScrollPhysics(),
          children: calendar,
        ),

        /// Footer
        if (widget.specialDays.isNotEmpty) ...[
          const SizedBox(height: 8.0),
          Row(
            spacing: 8.0,
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _theme.colorScheme.error,
                ),
              ),
              Text(
                widget.specialDaysText ?? '',
                style: _theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
