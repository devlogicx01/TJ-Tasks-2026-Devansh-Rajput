import 'package:flutter/material.dart';
import 'package:notes_app/widgets/widgets.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/storageService.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Color> noteColors = [
    Color(0xFFFFF1D6), // pastel yellow
    Color(0xFFDCEBFA), // pastel blue
    Color(0xFFE5F5E0), // pastel green
    Color(0xFFF9E0E8), // pastel pink
    Color(0xFFE8E0F5), // pastel purple
    Color(0xFFFFE4D6), // pastel peach
  ];

  final StorageService storage = StorageService();
  List<Note> notes = [];
  bool isSearching = false;
  bool hasSearched = false;
  final TextEditingController searchControl = TextEditingController();
  List<Note> filteredNotes = [];

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

  void searchNotes(String query) {
    setState(() {
      if (query.isEmpty) {
        hasSearched = false;
        filteredNotes.clear();
        return;
      }
      hasSearched = true;
      filteredNotes = notes.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      appBar: isSearching
          ? AppBar(
              leadingWidth: 40,
              titleSpacing: 10,
              backgroundColor: secondaryaccentcolor,

              leading: IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    // hasSearched = false;
                    searchControl.clear();
                    filteredNotes.clear();
                  });
                },
                icon: Icon(Icons.arrow_back_rounded),
              ),

              title: SizedBox(
                height: 50,

                child: TextField(
                  autofocus: true,
                  controller: searchControl,
                  onChanged: searchNotes,

                  style: TextStyle(
                    fontFamily: primaryfont,
                    fontWeight: FontWeight.bold,
                  ),

                  decoration: InputDecoration(
                    hintText: 'Search notes...',
                    filled: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),

                      borderSide: BorderSide.none,
                    ),

                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
            )
          : AppBar(
              backgroundColor: secondaryaccentcolor,

              title: Text(
                'Notes',
                style: TextStyle(
                  fontFamily: primaryfont,
                  fontWeight: FontWeight.bold,
                  fontSize: headingSize,
                ),
              ),

              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search_rounded, size: 28),
                  ),
                ),
              ],
            ),

      drawer: isSearching ? null : HomepageDrawer(),

      floatingActionButton: isSearching
          ? null
          : FloatingActionButton(
              onPressed: () async {
                await Navigator.pushNamed(context, '/newNotes');
                await loadNotes();
              },

              backgroundColor: secondaryColor,
              foregroundColor: primaryColor,
              elevation: 0,
              shape: CircleBorder(),

              child: Icon(Icons.add_rounded),
            ),

      body: isSearching
          ? !hasSearched
                ? const SizedBox.shrink()
                : filteredNotes.isEmpty
                ? Center(
                    child: Text(
                      'No notes found',

                      style: TextStyle(
                        fontFamily: primaryfont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: padding,
                    itemCount: filteredNotes.length,
                    itemBuilder: (context, index) {
                      final note = filteredNotes[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),

                        child: Card(
                          color: noteColors[index % noteColors.length],
                          elevation: 0,
                          child: ListTile(
                            onLongPress: () {
                              showDialog(
                                animationStyle: AnimationStyle(
                                  curve: Curves.easeOutCubic,
                                  duration: Duration(milliseconds: 200),
                                ),

                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),

                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,

                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.edit_rounded),
                                          title: Text(
                                            'Edit',
                                            style: TextStyle(
                                              fontFamily: primaryfont,
                                            ),
                                          ),

                                          onTap: () async {
                                            Navigator.pop(context);
                                            await Navigator.pushNamed(
                                              context,
                                              '/newNotes',
                                              arguments: note,
                                            );

                                            await loadNotes();
                                          },

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),

                                        ListTile(
                                          leading: Icon(
                                            Icons.delete_outline_rounded,
                                          ),
                                          title: Text(
                                            'Delete',
                                            style: TextStyle(
                                              fontFamily: primaryfont,
                                            ),
                                          ),

                                          onTap: () async {
                                            Navigator.pop(context);
                                            await storage.deleteNote(note.id);
                                            await loadNotes();
                                          },

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            titleAlignment: ListTileTitleAlignment.top,

                            title: Text(
                              note.title,
                              style: TextStyle(
                                fontFamily: primaryfont,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),

                                Text(
                                  note.content,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: primaryfont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Text(
                                  DateFormat('dd MMM • h:mm a')
                                      .format(note.createdAt),
                                  style: TextStyle(
                                    fontFamily: primaryfont,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            // trailing: IconButton(
                            //   onPressed: () {
                            //     showDialog(
                            //       animationStyle: AnimationStyle(
                            //         curve: Curves.easeOutCubic,
                            //         duration: Duration(milliseconds: 200),
                            //       ),

                            //       context: context,
                            //       builder: (context) {
                            //         return AlertDialog(
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),

                            //           content: Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.start,

                            //             children: [
                            //               ListTile(
                            //                 leading: Icon(Icons.edit_rounded),
                            //                 title: Text(
                            //                   'Edit',
                            //                   style: TextStyle(
                            //                     fontFamily: primaryfont,
                            //                   ),
                            //                 ),

                            //                 onTap: () async {
                            //                   Navigator.pop(context);
                            //                   await Navigator.pushNamed(
                            //                     context,
                            //                     '/newNotes',
                            //                     arguments: note,
                            //                   );

                            //                   await loadNotes();
                            //                 },

                            //                 shape: RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(20),
                            //                 ),
                            //               ),

                            //               ListTile(
                            //                 leading: Icon(
                            //                   Icons.delete_outline_rounded,
                            //                 ),
                            //                 title: Text(
                            //                   'Delete',
                            //                   style: TextStyle(
                            //                     fontFamily: primaryfont,
                            //                   ),
                            //                 ),

                            //                 onTap: () async {
                            //                   Navigator.pop(context);
                            //                   await storage.deleteNote(note.id);
                            //                   await loadNotes();
                            //                 },

                            //                 shape: RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(20),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         );
                            //       },
                            //     );
                            //   },
                            //   icon: Icon(Icons.more_vert),
                            // ),
                          ),
                        ),
                      );
                    },
                  )
          : notes.isEmpty
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

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),

                  child: Card(
                    color: noteColors[index % noteColors.length],
                    elevation: 0,
                    child: ListTile(
                      onLongPress: () {
                        showDialog(
                          animationStyle: AnimationStyle(
                            curve: Curves.easeOutCubic,
                            duration: Duration(milliseconds: 200),
                          ),

                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  ListTile(
                                    leading: Icon(Icons.edit_rounded),
                                    title: Text(
                                      'Edit',
                                      style: TextStyle(fontFamily: primaryfont),
                                    ),

                                    onTap: () async {
                                      Navigator.pop(context);
                                      await Navigator.pushNamed(
                                        context,
                                        '/newNotes',
                                        arguments: note,
                                      );

                                      await loadNotes();
                                    },

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),

                                  ListTile(
                                    leading: Icon(Icons.delete_outline_rounded),
                                    title: Text(
                                      'Delete',
                                      style: TextStyle(fontFamily: primaryfont),
                                    ),

                                    onTap: () async {
                                      Navigator.pop(context);
                                      await storage.deleteNote(note.id);
                                      await loadNotes();
                                    },

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      titleAlignment: ListTileTitleAlignment.top,

                      title: Text(
                        note.title,
                        style: TextStyle(
                          fontFamily: primaryfont,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),

                          Text(
                            note.content,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: primaryfont,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            DateFormat('dd MMM • h:mm a')
                                .format(note.createdAt),
                            style: TextStyle(
                              fontFamily: primaryfont,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
