import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.suffixIcon,
    required this.keyboardType,
    required this.contentPadding,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final EdgeInsets contentPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        style: TextStyle(color: AppColors.whiteColor, fontFamily: "Poppins"),
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
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
