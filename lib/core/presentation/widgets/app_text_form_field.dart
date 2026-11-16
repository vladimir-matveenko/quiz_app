import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.enabled,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.hintText,
    this.decoration,
    this.prefix,
    this.onTap,
    this.focusNode,
    this.unfocusOnTapOutside = true,
    this.inputFormatters,
    this.maxLines,
    this.onChanged,
  });

  final TextEditingController controller;
  final bool? enabled;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final InputDecoration? decoration;
  final Widget? prefix;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool unfocusOnTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText ?? false,
      enabled: enabled,
      onTap: onTap,
      keyboardType: keyboardType,
      textAlignVertical: .center,
      inputFormatters: inputFormatters,
      style: textTheme.bodyMedium,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration:
          decoration ??
          InputDecoration(
            labelText: labelText,
            prefix: prefix,
            hintText: hintText,
            hintStyle: textTheme.bodyMedium,
          ),
      onTapOutside: unfocusOnTapOutside
          ? (PointerDownEvent event) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          : null,
      validator: validator,
    );
  }
}
