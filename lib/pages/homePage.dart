import 'package:flutter/material.dart';
import 'package:notes_app/widgets/homepageDrawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),

      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        backgroundColor: Color(0xFFFAF9F6),

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

        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Color(0xFFFAF9F6),
        elevation: 0,
        shape: CircleBorder(),

        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
