import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/notes_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NotesView.routeName:
      return MaterialPageRoute(builder: (_) => const NotesView());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
