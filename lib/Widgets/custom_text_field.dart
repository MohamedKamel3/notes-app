import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.controller,
    this.initialValue,
    this.textInputAction,
    this.keyboardType,
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onSaved: onSaved,
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      validator: validator ?? _defaultValidator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: _buildBorder(const Color(0xffa1a1a1)),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(kPrimaryColor),
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.1),
      ),
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  OutlineInputBorder _buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? Colors.white.withOpacity(0.3),
        width: 1.5,
      ),
    );
  }
}
