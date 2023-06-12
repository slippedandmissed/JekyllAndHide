import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JHTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? name;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int? minLines;
  final int? maxLines;
  final FocusNode? focusNode;
  final EdgeInsets margin;
  final bool expands;
  final void Function(String)? onFieldSubmitted;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsets padding;
  final double borderRadius;
  final List<TextInputFormatter> inputFormatters;

  const JHTextField({
    super.key,
    required this.controller,
    this.name,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.autovalidateMode,
    this.focusNode,
    this.margin = const EdgeInsets.only(bottom: 16.0),
    this.onFieldSubmitted,
    this.hint,
    this.expands = false,
    this.prefixIcon,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 32,
    this.inputFormatters = const [],
  });

  @override
  Widget build(BuildContext context) {
    final actualInput = TextFormField(
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      scrollPadding: const EdgeInsets.only(bottom: 80),
      controller: controller,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        contentPadding: padding,
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.transparent,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (name != null) ...[
            Text(
              name!,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
          ],
          expands ? Expanded(child: actualInput) : actualInput,
        ],
      ),
    );
  }
}
