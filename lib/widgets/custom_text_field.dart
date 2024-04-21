import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/shared/color_values.dart';
import 'package:aksara_ebook_apps/shared/styles.dart';
import 'package:aksara_ebook_apps/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(fontSize: 14, color: ColorValues.grey90), // Adjust text style for search input
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 14, color: ColorValues.grey50), // Adjust hint text style
        prefixIcon: Icon(Icons.search, size: 24, color: ColorValues.grey90), // Change prefix icon to search icon
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust content padding
        filled: true,
        fillColor: ColorValues.grey10, // Adjust fill color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
          borderSide: BorderSide.none, // Remove border side
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
          borderSide: BorderSide(color: ColorValues.primary50, width: 1), // Add focused border side
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
          borderSide: BorderSide.none, // Remove border side
        ),
      ),
    );
  }
}
