import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';


class NewNotes extends StatefulWidget {
  const NewNotes({super.key});

  @override
  State<NewNotes> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 28,
          icon: Icon(Icons.arrow_back_rounded, size: 28),
        ),

        title: const Text(
          'Add Note',
          style: TextStyle(
            fontFamily: primaryfont,
            fontWeight: FontWeight.bold,
            fontSize: headingSize,
          ),
        ),
        backgroundColor: primaryColor,
      ),

      backgroundColor: primaryColor,
    );
  }
}
