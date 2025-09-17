import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.suffixIcon,
    required this.keyboardType,
    required this.contentPadding
  });
  final String hintText;
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final EdgeInsets contentPadding ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.lightBlue),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.lightBlue),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
