import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/constants/routes.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/splash/presentation/views/splash_view.dart';
import 'package:notes_app/simple_bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox('notes_box');
  Hive.registerAdapter(NoteModelAdapter());
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
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
