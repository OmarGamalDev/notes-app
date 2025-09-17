import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text,required this.onPressed, required this.icon});
  final String text;
  final VoidCallback? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppStyles.logocolor),
        Spacer(),
        CustomIconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
