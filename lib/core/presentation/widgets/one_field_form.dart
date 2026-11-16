import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import 'app_text_form_field.dart';

class OneFieldForm extends StatelessWidget {
  const OneFieldForm({
    super.key,
    required this.formKey,
    required this.enabled,
    required this.controller,
    required this.hint,
    this.keyboardType,
  });

  final GlobalKey<FormState> formKey;
  final bool enabled;
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AppTextFormField(
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType ?? .text,
        decoration: InputDecoration(hintText: hint),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'errors.noText'.tr();
          }
          return null;
        },
      ),
    );
  }
}
