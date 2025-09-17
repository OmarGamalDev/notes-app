import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 13),
      itemBuilder: (context, index) {
        return const CustomNoteItem();
      },
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
