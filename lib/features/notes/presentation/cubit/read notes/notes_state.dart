part of 'notes_cubit.dart';

abstract class NotesState {}

class NotesCubitInitial extends NotesState {}

class NotesFetchSuccess extends NotesState {
  final List<NoteModel> notes;
  NotesFetchSuccess(this.notes);
}


