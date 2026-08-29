import 'package:flutter/material.dart';

class Bin extends StatefulWidget {
  const Bin({super.key});

  @override
  State<Bin> createState() => _BinState();
}

class _BinState extends State<Bin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),

      appBar: AppBar(
        title: const Text(
          'Bin',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 22,
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
