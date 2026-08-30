import 'package:flutter/material.dart';
import 'package:notes_app/widgets/widgets.dart';
import 'package:notes_app/constants/constants.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

        backgroundColor:secondaryaccentcolor,

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
        onPressed: () {
          Navigator.pushNamed(context, '/newNotes');
        },

        backgroundColor: secondaryColor,
        foregroundColor: primaryColor,
        elevation: 0,
        shape: CircleBorder(),

        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
