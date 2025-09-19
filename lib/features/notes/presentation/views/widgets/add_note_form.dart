import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/core/shared_widgets/custom_button.dart';
import 'package:notes_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:notes_app/core/theme/theme_cubit.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubit/add%20notes/add_notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/colors_list_view.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            CustomTextFormField(
              hintText: 'Title',
              onSaved: (value) => title = value,
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              keyboardType: TextInputType.text,
            ),
            CustomTextFormField(
              hintText: 'Content',
              onSaved: (value) => subTitle = value,
              contentPadding: EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 16,
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            ColorsListView(),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            BlocBuilder<AddNotesCubit, AddNotesState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNotesLoading ? true : false,
                  text: 'Add',
                  backgroundColor:
                      context.read<ThemeCubit>().state == ThemeMode.dark
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                  style: AppStyles.boldBlackText.copyWith(
                      color: context.read<ThemeCubit>().state == ThemeMode.dark
                          ? AppColors.whiteColor
                          : AppColors.blackColor),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedCurrentDate =
                          DateFormat.yMEd().format(currentDate);
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: formattedCurrentDate,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNotesCubit>(context, listen: false)
                          .addNote(noteModel);
                      Navigator.of(context).pop();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  width: MediaQuery.of(context).size.width * .94,
                  height: MediaQuery.of(context).size.height * .06,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
          ],
        ),
      ),
    );
  }
}
