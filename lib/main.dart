import 'package:flutter/material.dart';
import 'package:notes_app/pages/pages.dart';

void main() {
  runApp(const Notes());
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const Homepage(),

      routes: {
        '/homePage': (context) => const Homepage(),
        '/newNotes': (context) => const NewNotes(),
        '/settings': (context) => const Settings(),
        '/bin': (context) => const Bin(),
      },
    );
  }
}
