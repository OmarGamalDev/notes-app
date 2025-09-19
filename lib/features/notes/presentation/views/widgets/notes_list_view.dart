import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/presentation/cubit/read%20notes/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      if (state is NotesFetchSuccess) {
        final notes = state.notes;
        if (notes.isEmpty) {
          return EmptyNotesBody();
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 13),
          itemBuilder: (context, index) {
            return CustomNoteItem(note: notes[index]);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notes.length,
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

class EmptyNotesBody extends StatelessWidget {
  const EmptyNotesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.note_alt_outlined,
            size: 80,
          ),
          const SizedBox(height: 20),
          Text(
            'No Notes Yet',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tap the + button to add your first note',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
