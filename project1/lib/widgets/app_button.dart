import 'dart:ui';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String? text;
  final String? label;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final bool isGlass;

  const AppButton({
    super.key,
    this.text,
    this.label,
    this.onPressed,
    this.color,
    this.textColor,
    this.isGlass = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovering = false;

  bool get _isEnabled => widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    final title = widget.label ?? widget.text ?? '';
    final primaryColor = widget.color ?? const Color(0xFF7B1FA2);

    Color backgroundColor;
    Border? border;

    if (widget.isGlass) {
      backgroundColor = _isEnabled
          ? (_isHovering
              ? Colors.white.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.2))
          : Colors.white.withValues(alpha: 0.1);
      border = Border.all(
        color: Colors.white.withValues(alpha: 0.4),
        width: 1.5,
      );
    } else {
      backgroundColor = _isEnabled
          ? (_isHovering ? const Color(0xFF6A1B9A) : primaryColor)
          : Colors.grey.shade400;
    }

    Widget buttonContent = ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.white70,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: widget.textColor ?? Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );

    return MouseRegion(
      onEnter: _isEnabled ? (_) => setState(() => _isHovering = true) : null,
      onExit: _isEnabled ? (_) => setState(() => _isHovering = false) : null,
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: widget.isGlass
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: border,
                  ),
                  child: buttonContent,
                ),
              ),
            )
          : AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isEnabled && _isHovering
                    ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: buttonContent,
            ),
    );
  }
}