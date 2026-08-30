import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class Bin extends StatefulWidget {
  const Bin({super.key});

  @override
  State<Bin> createState() => _BinState();
}

class _BinState extends State<Bin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Bin',
          style: TextStyle(
            fontFamily: primaryfont,
            fontWeight: FontWeight.bold,
            fontSize: headingSize,
          ),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 28),
        ),
      ),

      body: const Center(child: Text('No deleted notes')),
    );
  }
}
