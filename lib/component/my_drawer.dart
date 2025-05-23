import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: Column(
        children: [
          //drawer header
          DrawerHeader(
              child: FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.grey.shade500,
              ),
          ),
          const SizedBox(height: 25.0),
          //home tile
          Padding(
              padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.house,
              color: Colors.grey.shade500,
              ),
              title: Text('H O M E'),
              onTap: () {
                //this is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),
          //profile tile
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.user,
                color: Colors.grey.shade500,
              ),
              title: Text('P R O F I L E'),
              onTap: () {
                //pop drawer
                Navigator.pop(context);
                //navigate to profile page
                Navigator.pushNamed(context, '/profile_page');
              },
            ),
          ),
          //users tile
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.users,
                color: Colors.grey.shade500,
              ),
              title: Text('U S E R S'),
              onTap: () {
                //pop drawer
                Navigator.pop(context);
                //navigate to profile page
                Navigator.pushNamed(context, '/users_page');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.arrowRightFromBracket,
                color: Colors.grey.shade500,
              ),
              title: Text('L O G O U T'),
              onTap: () {
                //this is already the home screen so just pop drawer
                Navigator.pop(context);
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
