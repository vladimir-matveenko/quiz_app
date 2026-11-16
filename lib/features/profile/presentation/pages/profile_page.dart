import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/app/router/app_routes.dart';
import 'package:quiz_app/core/presentation/widgets/app_loader.dart';
import 'package:quiz_app/features/auth/presentation/cubit/cubit.dart';

import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../history/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/theme_selector.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late HistoryCubit historyCubit;
  late ProfileCubit cubit;
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileCubit>();
    cubit.loadProfile();
    historyCubit = context.read<HistoryCubit>();
    authCubit = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ColoredBox(
          color: theme.scaffoldBackgroundColor,
          child: state.isLoading
              ? const AppLoader()
              : Column(
                  mainAxisAlignment: .center,
                  spacing: 16.0,
                  children: [
                    Text(
                      state.profile?.firstName ?? '',
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      state.profile?.lastName ?? '',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const ThemeSelector(),
                    OutlinedButton(
                      onPressed: () {
                        context.push(AppRoutes.history);
                      },
                      child: Row(
                        spacing: 4.0,
                        mainAxisSize: .min,
                        children: [
                          Text('historyPage.screenName'.tr()),
                          Icon(
                            Icons.history_outlined,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                      onPressed: () {
                        context.go(
                          '${AppRoutes.profile}/${AppRoutes.editProfile}',
                        );
                      },
                      child: Row(
                        spacing: 4.0,
                        mainAxisSize: .min,
                        children: [
                          Text('editProfilePage.screenName'.tr()),
                          Icon(
                            Icons.edit,
                            color: theme.colorScheme.primary,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        textStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          decoration: .underline,
                          decorationColor: theme.colorScheme.primary,
                        ),
                      ),
                      onPressed: () {
                        context.push(AppRoutes.licenses);
                      },
                      child: const Text('Open Source Licenses'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                      onPressed: () async {
                        final result = await AppDialog.show(
                          context,
                          title: 'profilePage.btnRemove'.tr(),
                          text: 'profilePage.youWantRemove'.tr(),
                          cancelText: 'cancelText'.tr(),
                          okText: 'okText'.tr(),
                        );
                        if (result) {
                          historyCubit.deleteHistory();
                          cubit.deleteProfile();
                          authCubit.disableAuth();
                        }
                      },
                      child: Text('profilePage.btnRemoveProfile'.tr()),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
