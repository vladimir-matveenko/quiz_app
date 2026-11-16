import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/features/profile/domain/entity/profile_entity.dart';
import 'package:quiz_app/features/profile/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/profile/presentation/widgets/profile_screen_wrapper.dart';

import '../widgets/profile_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late ProfileCubit cubit;
  late ProfileEntity profile;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  int _wordCount = 10;
  bool jobDone = false;

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final updatedProfile = profile.copyWith(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      wordCount: _wordCount,
    );

    if (updatedProfile == cubit.state.profile) {
      return;
    }

    cubit.updateProfile(profile: updatedProfile);
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileCubit>();
    profile = cubit.state.profile!;
    _firstNameController.text = profile.firstName;
    _lastNameController.text = profile.lastName;
    _wordCount = profile.wordCount;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: ProfileScreenWrapper(
        successMessage: 'editProfilePage.updated'.tr(),
        buildBody: (context, state) {
          final isLoading = state.isLoading;
          final isBlocked = jobDone;
          return ProfileForm(
            isFormActive: !isLoading && !isBlocked,
            isLoading: isLoading,
            formKey: _formKey,
            initWordsCount: profile.wordCount,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            onWordCountChanged: (count) {
              _wordCount = count;
            },
            onSaveTapped: _onSave,
            mainButtonText: 'editProfilePage.btnSave'.tr(),
          );
        },
        onJobDone: () {
          jobDone = true;
        },
        onSuccess: () {
          context.pop();
        },
      ),
    );
  }
}
