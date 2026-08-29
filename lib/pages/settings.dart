import 'package:flutter/material.dart';

const settingsPagePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),

      appBar: AppBar(
        backgroundColor: Color(0xFFFAF9F6),

        title: const Text(
          'Settings',
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: settingsPagePadding,

            child: SwitchListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              secondary: Icon(Icons.dark_mode_rounded, size: 30),
              value: false,
              onChanged: (bool value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),

          Divider(
            thickness: 2,
            color: Color(0xFFE5E5E5),
            indent: 20,
            endIndent: 20,
          ),

          Container(
            padding: settingsPagePadding,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "About",
                  style: TextStyle(fontFamily: 'roboto', fontSize: 15),
                ),

                Padding(padding: EdgeInsets.only(top: 5)),

                Text(
                  "Version",
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text("1.0.0", style: TextStyle(fontFamily: 'roboto')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
