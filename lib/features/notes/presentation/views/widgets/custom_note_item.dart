import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/constants/app_colors.dart' show AppColors;
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/core/theme/theme_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          decoration: BoxDecoration(
            // color: Color(0xffffcc7b),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8, top: 12),
                  child: Text('Flutter Tips',
                      style: AppStyles.boldBlackText.copyWith(
                        color:
                            context.watch<ThemeCubit>().state == ThemeMode.dark
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                      )),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8),
                  child: Text(
                    'Build Your Career with Flutter Developer',
                    style: AppStyles.w600DarkGrayText.copyWith(
                      color: context.watch<ThemeCubit>().state == ThemeMode.dark
                          ? AppColors.whiteColorLight
                          : AppColors.blackColor,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    // color: Colors.red,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 18, bottom: 12),
                child: Text(
                  'May 28, 2024',
                  style: AppStyles.w600DarkGrayText.copyWith(
                    color: context.watch<ThemeCubit>().state == ThemeMode.dark
                        ? AppColors.whiteColorLight
                        : AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
