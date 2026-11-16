import 'package:material_ui/material_ui.dart';

import '../../theme/domain/entity/app_theme_mode.dart';
import '../../theme/domain/repository/theme_repository.dart';
import '../../theme/presentation/cubit/cubit.dart';
import 'app_theme.dart';
import 'app_theme_colors.dart';

/// Provider for theme management that can be used across the application.
///
/// This provider simplifies access to theme data and handles theme persistence.
class ThemeProvider with ChangeNotifier {
  ThemeProvider({required this.cubit, required this.repository}) {
    _loadTheme();
  }

  final ThemeCubit cubit;
  final ThemeRepository repository;

  AppThemeMode _currentMode = AppThemeMode.dark;
  ThemeData? _currentTheme;

  AppThemeMode get currentMode => _currentMode;

  ThemeData? get currentTheme => _currentTheme;

  /// Loads the saved theme from repository.
  Future<void> _loadTheme() async {
    final result = repository.getTheme();
    result.fold(
      (l) {
        _currentMode = AppThemeMode.dark;
        _currentTheme = AppTheme.getThemeData(AppThemeColors.dark, true);
      },
      (r) {
        _currentMode = r ?? AppThemeMode.dark;
        _currentTheme = _mapToThemeData(_currentMode);
      },
    );
    notifyListeners();
  }

  /// Changes the theme and persists it.
  Future<void> setTheme(AppThemeMode mode) async {
    _currentMode = mode;
    await repository.setTheme(mode: mode);
    _currentTheme = _mapToThemeData(mode);
    notifyListeners();
  }

  /// Returns the current theme data.
  ThemeData getThemeData() {
    return _currentTheme ?? AppTheme.getThemeData(AppThemeColors.dark, true);
  }

  ThemeData _mapToThemeData(AppThemeMode mode) {
    final colors = AppThemeColors.fromMode(mode);
    return mode == AppThemeMode.light
        ? AppTheme.getThemeData(colors, false)
        : AppTheme.getThemeData(colors, true);
  }
}
