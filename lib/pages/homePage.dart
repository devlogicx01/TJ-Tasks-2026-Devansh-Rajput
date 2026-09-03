import 'package:flutter/material.dart';
import 'package:notes_app/widgets/widgets.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/storageService.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final StorageService storage = StorageService();
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    final savedNotes = await storage.getNotes();

    setState(() {
      notes = savedNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            fontFamily: primaryfont,
            fontWeight: FontWeight.bold,
            fontSize: headingSize,
          ),
        ),

        backgroundColor: secondaryaccentcolor,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded, size: 28),
            ),
          ),
        ],
      ),

      drawer: HomepageDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, '/newNotes');
          loadNotes();
        },

        backgroundColor: secondaryColor,
        foregroundColor: primaryColor,
        elevation: 0,
        shape: CircleBorder(),

        child: Icon(Icons.add_rounded),
      ),

      body: notes.isEmpty
          ? Center(
              child: Text(
                'No notes yet',
                style: TextStyle(
                  fontFamily: primaryfont,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              padding: padding,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];

                return Card(
                  child: ListTile(
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        '/newNotes',
                        arguments: note,
                      );

                      loadNotes();
                    },
                    title: Text(
                      note.title,
                      style: TextStyle(
                        fontFamily: primaryfont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      note.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    trailing: IconButton(
                      onPressed: () async {
                        await storage.deleteNote(note.id);
                        loadNotes();
                      },
                      icon: const Icon(Icons.delete_outline_rounded),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
