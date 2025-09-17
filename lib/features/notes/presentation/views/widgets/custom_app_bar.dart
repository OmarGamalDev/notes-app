import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Notes', style: AppStyles.logocolor),
        Spacer(),
        CustomSearchIcon(),
      ],
    );
  }
}