import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.focusNode,
    this.autoFocus = false,
    this.onSubmit,
    required this.state,
  });

  final Widget icon;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String? s)? validator;
  final FocusNode? focusNode;
  final bool autoFocus;
  final ValueChanged<String>? onSubmit;
  final FormFieldState<String> state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      onFieldSubmitted: onSubmit,
      autofocus: autoFocus,
      focusNode: focusNode,
      obscureText: obscureText,
      style: theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      ),
      controller: controller,
      decoration: InputDecoration(
        errorText: state.errorText,
        suffixIcon:
            controller.text.isEmpty
                ? null
                : IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: controller.clear,
                  icon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: controller.clear,
                  ),
                ),
        border: OutlineInputBorder(),
        icon: icon,
        labelText: label,
      ),
      validator: validator,
    );
  }
}
