import 'package:flutter/material.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFFAF9F6),
      shape: LinearBorder(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: const Color(0xFFC3B4FD)),

            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(244, 124, 77, 255),
                  radius: 25,

                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                ),

                Padding(padding: const EdgeInsets.only(left: 10)),

                Text(
                  "My Notes",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.delete_outline_rounded, size: 30),

            title: Text(
              "Bin",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),

            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/bin');
            },
          ),

          ListTile(
            leading: Icon(Icons.settings_rounded, size: 30),

            title: Text(
              "Settings",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),

            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),

          ListTile(
            leading: Icon(Icons.info_outline_rounded, size: 30),

            title: Text(
              "About",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),

            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
