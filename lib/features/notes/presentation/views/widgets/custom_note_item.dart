import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/constants/app_colors.dart' show AppColors;
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/core/shared_widgets/custom_button.dart';
import 'package:notes_app/core/theme/theme_cubit.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubit/read%20notes/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.routeName, arguments: note);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8, top: 12),
                  child: Text(note.title,
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
                    note.subTitle,
                    style: AppStyles.w600DarkGrayText.copyWith(
                      color: context.watch<ThemeCubit>().state == ThemeMode.dark
                          ? AppColors.whiteColorLight
                          : AppColors.blackColor,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    deleteShowDialog(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 18, bottom: 12),
                child: Text(
                  note.date,
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

  Future<dynamic> deleteShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.read<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.blackColor
              : AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Delete Note',
            style: AppStyles.boldBlackText.copyWith(
              color: context.read<ThemeCubit>().state == ThemeMode.dark
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this note?',
            style: AppStyles.boldBlackText.copyWith(
              fontSize: 18,
              color: context.read<ThemeCubit>().state == ThemeMode.dark
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            CustomButton(
              height: 40,
              width: 80,
              style: AppStyles.boldBlackText.copyWith(color: Colors.white),
              text: 'Yes',
              backgroundColor: Colors.red,
              onPressed: () {
                note.delete();
                Navigator.of(context).pop();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
            ),
            CustomButton(
              height: 40,
              width: 80,
              style: AppStyles.boldBlackText.copyWith(color: Colors.white),
              text: 'No',
              backgroundColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
