import 'package:flutter/material.dart';

import 'app_semantic_colors.dart';
import 'app_theme_colors.dart';

class AppTheme {
  static ThemeData getThemeData(AppThemeColors appColors, bool isDark) {
    if (isDark) {
      return ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: appColors.scaffoldBackground,
        unselectedWidgetColor: appColors.unselectedWidget,
        canvasColor: appColors.canvas,
        splashColor: appColors.splash,
        extensions: [AppSemanticColors(success: appColors.success)],
        colorScheme: const ColorScheme.dark().copyWith(
          brightness: Brightness.dark,
          primary: appColors.primary,
          onPrimary: appColors.onPrimary,
          surfaceTint: appColors.surfaceTint,
          error: appColors.error,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: appColors.primaryText),
          headlineMedium: TextStyle(color: appColors.primaryText),
          headlineSmall: TextStyle(color: appColors.primaryText),
          titleLarge: TextStyle(color: appColors.primaryText),
          titleMedium: TextStyle(color: appColors.primaryText),
          titleSmall: TextStyle(color: appColors.primaryText),
          bodyLarge: TextStyle(color: appColors.primaryText),
          bodyMedium: TextStyle(color: appColors.secondaryText),
          bodySmall: TextStyle(color: appColors.secondaryText),
          labelLarge: TextStyle(color: appColors.secondaryText),
          labelMedium: TextStyle(color: appColors.secondaryText),
          labelSmall: TextStyle(color: appColors.secondaryText),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          surfaceTintColor: appColors.surfaceTint,
          scrolledUnderElevation: 0.0,
          backgroundColor: appColors.bottomBarBackground,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: .fixed,
          backgroundColor: appColors.bottomBarBackground,
          selectedItemColor: appColors.primaryText,
          unselectedItemColor: appColors.unselectedWidget,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const .symmetric(vertical: 4.0, horizontal: 8.0),
          border: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.fieldBorder, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.fieldBorder, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: appColors.fieldBorderFocussed,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: appColors.fieldBorderDisabled,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.error, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.error, width: 2.0),
          ),
          errorStyle: TextStyle(color: appColors.error),
          hintStyle: TextStyle(color: appColors.secondaryText),
          labelStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return TextStyle(color: appColors.error);
            }
            return const TextStyle();
          }),
          floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return TextStyle(color: appColors.error);
            }
            if (states.contains(WidgetState.focused)) {
              return TextStyle(color: appColors.primary);
            }
            return TextStyle(color: appColors.unselectedWidget);
          }),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            textStyle: .all(TextStyle(color: appColors.secondaryText)),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: .circular(10.0),
              borderSide: BorderSide(color: appColors.fieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: .circular(10.0),
              borderSide: BorderSide(color: appColors.fieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: .circular(10.0),
              borderSide: BorderSide(color: appColors.fieldBorderFocussed),
            ),
            contentPadding: const .symmetric(horizontal: 8.0, vertical: 4.0),
            prefixIconConstraints: const BoxConstraints(maxHeight: 24.0),
          ),
          menuStyle: MenuStyle(
            backgroundColor: .all(appColors.scaffoldBackground),
            surfaceTintColor: .resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return appColors.fieldBorder;
              }
              return appColors.surfaceTint;
            }),
            padding: .all(.zero),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColors.primary,
            disabledBackgroundColor: appColors.unselectedWidget,
            foregroundColor: appColors.onPrimary,
            disabledForegroundColor: appColors.secondaryText,
            shape: RoundedRectangleBorder(borderRadius: .circular(12.0)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(appColors.surfaceTint),
            foregroundColor: .resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return appColors.unselectedWidget;
              }
              return appColors.primary;
            }),
            side: .resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide(
                  color: appColors.unselectedWidget,
                  width: 2.0,
                );
              }
              return BorderSide(color: appColors.primary, width: 2.0);
            }),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: .circular(12.0)),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: .circular(8.0)),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: .circular(8.0)),
            padding: const .all(8.0),
            backgroundColor: appColors.surfaceTint,
            elevation: 0,
            shadowColor: appColors.surfaceTint,
            surfaceTintColor: appColors.surfaceTint,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: const CircleBorder(),
          backgroundColor: appColors.primary,
          foregroundColor: appColors.onPrimary,
          enableFeedback: true,
          elevation: 2,
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: .all(appColors.unselectedWidget),
          shadowColor: .all(appColors.surfaceTint),
          elevation: .all(0),
          surfaceTintColor: .all(appColors.surfaceTint),
          padding: .all(const .symmetric(horizontal: 12.0, vertical: 4.0)),
          shape: .resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return RoundedRectangleBorder(
                borderRadius: .circular(10.0),
                side: BorderSide(color: appColors.fieldBorderFocussed),
              );
            }
            return RoundedRectangleBorder(borderRadius: .circular(10.0));
          }),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.cyan.withValues(alpha: 0.8),
          ),
        ),
        cardTheme: CardThemeData(color: appColors.cardBackground),
        sliderTheme: SliderThemeData(
          padding: const .symmetric(horizontal: 16.0),
          activeTrackColor: appColors.primary,
          inactiveTrackColor: appColors.secondaryText,
          thumbColor: appColors.primary,
          activeTickMarkColor: appColors.onPrimary,
          inactiveTickMarkColor: appColors.scaffoldBackground,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: appColors.bottomBarBackground,
          insetPadding: const .all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12.0),
          ),
        ),
      );
    } else {
      return ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: appColors.scaffoldBackground,
        unselectedWidgetColor: appColors.unselectedWidget,
        canvasColor: appColors.canvas,
        splashColor: appColors.splash,
        extensions: [AppSemanticColors(success: appColors.success)],
        colorScheme: const ColorScheme.light().copyWith(
          brightness: Brightness.light,
          primary: appColors.primary,
          onPrimary: appColors.onPrimary,
          surfaceTint: appColors.surfaceTint,
          error: appColors.error,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: appColors.primaryText),
          headlineMedium: TextStyle(color: appColors.primaryText),
          headlineSmall: TextStyle(color: appColors.primaryText),
          titleLarge: TextStyle(color: appColors.primaryText),
          titleMedium: TextStyle(color: appColors.primaryText),
          titleSmall: TextStyle(color: appColors.primaryText),
          bodyLarge: TextStyle(color: appColors.primaryText),
          bodyMedium: TextStyle(color: appColors.secondaryText),
          bodySmall: TextStyle(color: appColors.secondaryText),
          labelLarge: TextStyle(color: appColors.secondaryText),
          labelMedium: TextStyle(color: appColors.secondaryText),
          labelSmall: TextStyle(color: appColors.secondaryText),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          surfaceTintColor: appColors.surfaceTint,
          scrolledUnderElevation: 0.0,
          backgroundColor: appColors.bottomBarBackground,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: .fixed,
          backgroundColor: appColors.bottomBarBackground,
          selectedItemColor: appColors.primaryText,
          unselectedItemColor: appColors.unselectedWidget,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const .symmetric(vertical: 4.0, horizontal: 8.0),
          border: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.fieldBorder, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.fieldBorder, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: appColors.fieldBorderFocussed,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: appColors.fieldBorderDisabled,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.error, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const .all(Radius.circular(12.0)),
            borderSide: BorderSide(color: appColors.error, width: 2.0),
          ),
          errorStyle: TextStyle(color: appColors.error),
          hintStyle: TextStyle(color: appColors.secondaryText),
          labelStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return TextStyle(color: appColors.error);
            }
            return const TextStyle();
          }),
          floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return TextStyle(color: appColors.error);
            }
            if (states.contains(WidgetState.focused)) {
              return TextStyle(color: appColors.primary);
            }
            return const TextStyle(color: Colors.grey);
          }),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            textStyle: .all(TextStyle(color: appColors.secondaryText)),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: .circular(10.0),
              borderSide: BorderSide(color: appColors.fieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: .circular(10.0),
              borderSide: BorderSide(color: appColors.fieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: .circular(10.0),
              borderSide: BorderSide(color: appColors.fieldBorderFocussed),
            ),
            contentPadding: const .symmetric(horizontal: 8.0, vertical: 4.0),
            prefixIconConstraints: const BoxConstraints(maxHeight: 24.0),
          ),
          menuStyle: MenuStyle(
            backgroundColor: .all(appColors.scaffoldBackground),
            surfaceTintColor: .resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return appColors.fieldBorder;
              }
              return appColors.surfaceTint;
            }),
            padding: .all(.zero),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColors.primary,
            disabledBackgroundColor: appColors.unselectedWidget,
            foregroundColor: appColors.onPrimary,
            disabledForegroundColor: appColors.secondaryText,
            shape: RoundedRectangleBorder(borderRadius: .circular(12.0)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(appColors.surfaceTint),
            foregroundColor: .resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return appColors.unselectedWidget;
              }
              return appColors.primary;
            }),
            side: .resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide(
                  color: appColors.unselectedWidget,
                  width: 2.0,
                );
              }
              return BorderSide(color: appColors.primary, width: 2.0);
            }),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: .circular(12.0)),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: .circular(8.0)),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: .circular(8.0)),
            padding: const .all(8.0),
            backgroundColor: appColors.surfaceTint,
            elevation: 0,
            shadowColor: appColors.surfaceTint,
            surfaceTintColor: appColors.surfaceTint,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: const CircleBorder(),
          backgroundColor: appColors.primary,
          foregroundColor: appColors.onPrimary,
          enableFeedback: true,
          elevation: 2,
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: .all(appColors.unselectedWidget),
          shadowColor: .all(appColors.surfaceTint),
          elevation: .all(0),
          surfaceTintColor: .all(appColors.surfaceTint),
          padding: .all(const .symmetric(horizontal: 12.0, vertical: 4.0)),
          shape: .resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return RoundedRectangleBorder(
                borderRadius: .circular(10.0),
                side: BorderSide(color: appColors.primary),
              );
            }
            return RoundedRectangleBorder(borderRadius: .circular(10.0));
          }),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.cyan.withValues(alpha: 0.8),
          ),
        ),
        cardTheme: CardThemeData(color: appColors.cardBackground),
        sliderTheme: SliderThemeData(
          padding: const .symmetric(horizontal: 16.0),
          activeTrackColor: appColors.primary,
          inactiveTrackColor: appColors.secondaryText,
          thumbColor: appColors.primary,
          activeTickMarkColor: appColors.onPrimary,
          inactiveTickMarkColor: appColors.scaffoldBackground,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: appColors.bottomBarBackground,
          insetPadding: const .all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12.0),
          ),
        ),
      );
    }
  }
}
