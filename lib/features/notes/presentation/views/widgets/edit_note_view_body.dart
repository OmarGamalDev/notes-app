import 'package:flutter/material.dart';
import 'package:notes_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

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
              onPressed: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).size.height * .04),
        ),
        SliverToBoxAdapter(
          child: CustomTextField(
            hintText: 'Title',
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomTextField(
            hintText: 'Content',
            contentPadding: EdgeInsets.symmetric(vertical: 80, horizontal: 16),
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
