import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/app_text_form_field.dart';
import '../../../../core/presentation/widgets/one_value_slider.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.isFormActive,
    required this.isLoading,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    this.initWordsCount,
    required this.onWordCountChanged,
    required this.onSaveTapped,
    required this.mainButtonText,
  });

  final bool isFormActive;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final int? initWordsCount;
  final Function(int) onWordCountChanged;
  final VoidCallback onSaveTapped;
  final String mainButtonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: .only(
          top: 24.0,
          left: 24.0,
          right: 24.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .stretch,
            spacing: 16.0,
            children: [
              AppTextFormField(
                controller: firstNameController,
                enabled: isFormActive,
                keyboardType: .name,
                hintText: 'createProfilePage.fieldFirstName'.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'fieldValidation.fieldIsRequired'.tr();
                  }
                  return null;
                },
              ),
              AppTextFormField(
                controller: lastNameController,
                enabled: isFormActive,
                keyboardType: .name,
                hintText: 'createProfilePage.fieldLastName'.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'fieldValidation.fieldIsRequired'.tr();
                  }
                  return null;
                },
              ),
              Column(
                crossAxisAlignment: .start,
                spacing: 8.0,
                children: [
                  Text('${'createProfilePage.wordCount'.tr()}:'),
                  OneValueSlider(
                    isActive: isFormActive,
                    initValue: initWordsCount,
                    onChanged: onWordCountChanged,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: !isFormActive ? null : onSaveTapped,
                child: isLoading ? AppLoader.small() : Text(mainButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
