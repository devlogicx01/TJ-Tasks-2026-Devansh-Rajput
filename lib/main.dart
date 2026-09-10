import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/pages.dart';

import 'constants/color.dart';

void main() {
  runApp(const Notes());
}

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: secondaryaccentcolor,
          
        ),
      ),

      home: Homepage(),

      routes: {
        '/homePage': (context) => Homepage(),

        '/newNotes': (context) {
          final note = ModalRoute.of(context)!.settings.arguments as Note?;
          return NewNotes(note: note);
        },

        '/settings': (context) => Settings(),
        //'/bin': (context) => const Bin(),
      },
    );
  }
}
