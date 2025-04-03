import 'package:flutter/material.dart';
import 'package:notes_app/DataBase/notes_provider.dart';
import 'package:notes_app/Pages/notes_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotesProvider()..loadNotes(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData.dark(),
      home: const NotesPage(),
    );
  }
}
