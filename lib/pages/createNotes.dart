import 'package:flutter/material.dart';

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
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xFFFAF9F6),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 10),
        child: Column(children: [
          ],
        ),
      ),
      backgroundColor: Color(0xFFFAF9F6),
    );
  }
}
