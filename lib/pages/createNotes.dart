import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/storageService.dart';

class NewNotes extends StatefulWidget {
  final Note? note;

  const NewNotes({super.key, this.note});

  @override
  State<NewNotes> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotes> {
  final StorageService storage = StorageService();
  final titleControl = TextEditingController();
  final contentControl = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      titleControl.text = widget.note!.title;
      contentControl.text = widget.note!.content;
    }
  }

  @override
  void dispose() {
    titleControl.dispose();
    contentControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 28,
          icon: Icon(Icons.arrow_back_rounded, size: 28),
        ),

        title: TextField(
          controller: titleControl,
          autofocus: true,
          style: TextStyle(
            fontFamily: primaryfont,
            fontWeight: FontWeight.bold,
            fontSize: headingSize,
          ),

          maxLines: 1,
          maxLength: 25,

          decoration: InputDecoration(
            counterText: '',
            hintText: 'Enter Title',
            hintStyle: TextStyle(fontFamily: primaryfont),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: secondaryaccentcolor,

        actions: [
          IconButton(
            onPressed: () async {
              if (widget.note == null) {
                final notes = await storage.getNotes();

                final note = Note(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleControl.text,
                  content: contentControl.text,
                  createdAt: DateTime.now(),
                );

                notes.add(note);

                await storage.saveNotes(notes);
              } else {
                final updatedNote = Note(
                  id: widget.note!.id,
                  title: titleControl.text,
                  content: contentControl.text,
                  createdAt: widget.note!.createdAt,
                );

                await storage.updateNote(updatedNote);
              }

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.check_rounded, size: 28),
          ),

          Padding(padding: EdgeInsets.only(right: 10)),
        ],
      ),

      body: Container(
        padding: padding,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Note",
              style: TextStyle(
                fontFamily: primaryfont,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            Expanded(
              child: TextField(
                controller: contentControl,
                //expands: true,
                maxLength: 10000,
                maxLines: null,

                style: TextStyle(
                  fontFamily: primaryfont,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),

                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Start writing your notes...',
                  hintStyle: TextStyle(
                    fontFamily: primaryfont,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
