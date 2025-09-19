import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubit/read%20notes/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/colors_list_view.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_app_bar.dart';

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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).size.height * .05),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).size.height * .04),
        ),
        SliverToBoxAdapter(
          child: CustomTextFormField(
            hintText: widget.note.title,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              title = value;
            },
          ),
        ),
        SliverToBoxAdapter(
          child: CustomTextFormField(
            hintText: widget.note.subTitle,
            contentPadding: EdgeInsets.symmetric(vertical: 80, horizontal: 16),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              content = value;
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).size.height * .02),
        ),
        SliverToBoxAdapter(
          child: ColorsListView(),
        ),
      ],
    );
  }
}
