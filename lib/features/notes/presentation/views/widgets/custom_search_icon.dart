import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .06,
      width: MediaQuery.of(context).size.width * .12,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: const Icon(Icons.search, color: AppColors.whiteColor, size: 28),
      ),
    );
  }
}
