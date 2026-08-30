import 'package:flutter/material.dart';
import 'package:notes_app/constants/color.dart';
import 'package:notes_app/constants/constants.dart';

const settingsPagePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      appBar: AppBar(
        backgroundColor: primaryColor,

        title: const Text(
          'Settings',
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
                  fontFamily: primaryfont,
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

          divider,

          Container(
            padding: settingsPagePadding,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "About",
                  style: TextStyle(fontFamily: primaryfont, fontSize: 15),
                ),

                Padding(padding: EdgeInsets.only(top: 5)),

                Text(
                  "Version",
                  style: TextStyle(
                    fontFamily: primaryfont,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text("1.0.0", style: TextStyle(fontFamily: primaryfont)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
