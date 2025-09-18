import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/features/notes/presentation/cubit/theme_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});
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
        SizedBox(width: MediaQuery.of(context).size.width * .03),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return Container(
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.read<ThemeCubit>().state == ThemeMode.dark
                      ? AppColors.whiteColor.withValues(alpha: .05)
                      : AppColors.blackColor.withValues(alpha: .05),
                ),
                child: IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    icon: Icon(
                      context.read<ThemeCubit>().state == ThemeMode.dark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                    )));
          },
        ),
      ],
    );
  }
}
