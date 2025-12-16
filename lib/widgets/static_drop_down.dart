import 'package:flutter/material.dart';
import 'package:walletric/config/colors.dart';

class StaticDropdown extends StatelessWidget {
  final List<String>? items;
  final String? hint;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final Color? fillColor;
  final TextStyle? hintTextStyle;
  final String? Function(String?)? validator;

  const StaticDropdown({
    super.key,
    this.items,
    this.hint,
    this.selectedValue,
    this.onChanged,
    this.fillColor,
    this.hintTextStyle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      isExpanded: true,
      value: selectedValue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(6),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Palette.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Palette.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: fillColor,
        filled: fillColor != null,
      ),
      hint: Text(
        hint ?? "Select an option",
        style: hintTextStyle ??
            const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
      ),
      style: const TextStyle(
        fontSize: 14,
        color: Palette.backLight,
      ),
      isDense: true,
      items: items?.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
