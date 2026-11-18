import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final IconData fieldIcon;
  final TextEditingController controller;
  final String? Function(String?) validation;
  final bool isPassword;

  const CustomField({
    required this.label,
    required this.controller,
    required this.fieldIcon,
    required this.validation,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(fieldIcon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
