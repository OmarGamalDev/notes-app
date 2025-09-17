import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/routes.dart';
import 'package:notes_app/features/notes/presentation/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff313031),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: NotesView.routeName,
    );
  }
}
