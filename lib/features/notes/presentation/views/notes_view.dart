import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/presentation/cubit/read%20notes/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static const String routeName = '/notes';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        body: NotesViewBody(),
        floatingActionButton: CustomFloatingActionButton(),
      ),
    );
  }
}
