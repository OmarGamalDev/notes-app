import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/edit_note_view.dart';
import 'package:notes_app/features/notes/presentation/views/notes_view.dart';
import 'package:notes_app/features/splash/presentation/views/splash_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case NotesView.routeName:
      return MaterialPageRoute(builder: (_) => const NotesView());
    case EditNoteView.routeName:
      return MaterialPageRoute(builder: (_) => const EditNoteView());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
