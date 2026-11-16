import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/theme/presentation/cubit/state.dart';

import '../../../app/theme/app_theme.dart';
import '../../../app/theme/app_theme_colors.dart';
import '../../../core/domain/usecases/usecase.dart';
import '../../domain/entity/app_theme_mode.dart';
import '../../domain/usecases/get_theme_usecase.dart';
import '../../domain/usecases/set_theme_usecase.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._getThemeUseCase, this._setThemeUseCase)
    : super(const ThemeState());
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;

  Future<void> loadTheme() async {
    final mode = await _getThemeUseCase(NoParams());
    mode.fold(
      (l) {
        emit(
          state.copyWith(
            mode: AppThemeMode.dark,
            theme: AppTheme.getThemeData(AppThemeColors.dark, true),
          ),
        );
      },
      (r) {
        if (r != null) {
          emit(state.copyWith(theme: _mapToFlutter(r), mode: r));
        } else {
          emit(
            state.copyWith(
              mode: AppThemeMode.dark,
              theme: AppTheme.getThemeData(AppThemeColors.dark, true),
            ),
          );
        }
      },
    );
  }

  Future<void> changeTheme(AppThemeMode mode) async {
    await _setThemeUseCase(SetThemeParams(mode: mode));
    emit(state.copyWith(theme: _mapToFlutter(mode), mode: mode));
  }

  ThemeData _mapToFlutter(AppThemeMode mode) {
    final colors = AppThemeColors.fromMode(mode);
    return colors == AppThemeColors.light
        ? AppTheme.getThemeData(colors, false)
        : AppTheme.getThemeData(colors, true);
  }
}
