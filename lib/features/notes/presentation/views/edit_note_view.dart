import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
static const String routeName = '/editNote';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:EditNoteViewBody() ,
    );
  }
}