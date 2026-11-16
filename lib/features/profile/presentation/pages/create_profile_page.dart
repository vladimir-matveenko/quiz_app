import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/features/auth/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/profile/presentation/cubit/cubit.dart';

import '../widgets/profile_form.dart';
import '../widgets/profile_screen_wrapper.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  int _wordCount = 10;
  bool jobDone = false;

  void _handleCreateProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().createProfile(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        wordCount: _wordCount,
      );
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createProfilePage.screenName'.tr()),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: ProfileScreenWrapper(
        successMessage: 'profilePage.created'.tr(),
        buildBody: (context, state) {
          final isLoading = state.isLoading;
          final isBlocked = jobDone;
          return ProfileForm(
            isFormActive: !isLoading && !isBlocked,
            isLoading: isLoading,
            formKey: _formKey,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            onWordCountChanged: (count) {
              _wordCount = count;
            },
            onSaveTapped: _handleCreateProfile,
            mainButtonText: 'createProfilePage.btnCreate'.tr(),
          );
        },
        onJobDone: () {
          jobDone = true;
        },
        onSuccess: () {
          context.read<AuthCubit>().checkAuth();
        },
      ),
    );
  }
}
