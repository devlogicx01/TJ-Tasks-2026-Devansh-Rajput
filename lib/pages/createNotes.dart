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
            onPressed: () {},
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
