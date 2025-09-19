import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubit/read%20notes/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/edit_notes_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppBar(
                text: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                CustomTextFormField(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                  hintText: widget.note.title,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                CustomTextFormField(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                  hintText: widget.note.subTitle,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    content = value;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                EditNotesColorsList(
                  note: widget.note,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
