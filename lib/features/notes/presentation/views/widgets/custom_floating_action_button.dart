import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue.withValues(alpha: .4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: FloatingActionButton(
        backgroundColor: AppColors.lightBlue,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, size: 28, color: AppColors.blackColor),
      ),
    );
  }
}