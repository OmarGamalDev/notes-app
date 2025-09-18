import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/presentation/cubit/read%20notes/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * .05),
          ),
          SliverToBoxAdapter(
              child: CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
            onPressed: () {},
          )),
          const SliverToBoxAdapter(child: NotesListView()),
        ],
      ),
    );
  }
}
