part of 'add_notes_cubit.dart';

abstract class AddNotesState {
  const AddNotesState();
}

class AddNotesInitial extends AddNotesState {}
class AddNotesLoading extends AddNotesState {}
class AddNotesSuccess extends AddNotesState {}
class AddNotesFailure extends AddNotesState {
  final String errorMessage;
  const AddNotesFailure(this.errorMessage);
}