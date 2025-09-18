import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesCubitInitial());

  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>('notes_box');
    emit(NotesFetchSuccess(notesBox.values.toList()));
  }
}

