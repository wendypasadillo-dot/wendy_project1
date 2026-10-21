import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final int maxLines;
  final bool isDark;

  const AppTextField({
    super.key,
    required this.label,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.maxLines = 1,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor = isDark ? Colors.white : Colors.black87;
    final effectiveLabelColor =
        isDark ? Colors.white.withValues(alpha: 0.8) : Colors.deepPurple;
    final effectiveFillColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.deepPurple.withValues(alpha: 0.04);
    final effectiveBorderColor = isDark
        ? Colors.white.withValues(alpha: 0.3)
        : Colors.deepPurple.shade200;

    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      maxLines: isPassword ? 1 : maxLines,
      style: TextStyle(color: effectiveTextColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: effectiveLabelColor),
        prefixIcon: icon != null
            ? Icon(icon, color: isDark ? Colors.white : Colors.deepPurple)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: effectiveFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: effectiveBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: effectiveBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.white : Colors.deepPurple,
            width: 2,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
