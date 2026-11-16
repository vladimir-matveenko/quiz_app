import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/presentation/widgets/custom_dropdown_menu.dart';
import '../../../../theme/domain/entity/app_theme_mode.dart';
import '../../../../theme/presentation/cubit/cubit.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  late ThemeCubit cubit;
  late AppThemeMode initialValue;
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = context.read<ThemeCubit>();
    final state = context.watch<ThemeCubit>().state;
    initialValue = state.mode;
    textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownMenu<AppThemeMode>(
      initialValue: initialValue,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            cubit.changeTheme(value);
          });
        }
      },
      entries: <DropdownMenuEntry<AppThemeMode>>[
        DropdownMenuEntry<AppThemeMode>(
          value: AppThemeMode.dark,
          label: 'profilePage.themeDark'.tr(),
          labelWidget: Text(
            'profilePage.themeDark'.tr(),
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuEntry<AppThemeMode>(
          value: AppThemeMode.light,
          label: 'profilePage.themeLight'.tr(),
          labelWidget: Text(
            'profilePage.themeLight'.tr(),
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
