import 'package:firebase_1/login&signup/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout();
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> LoginPage()
                  ),
                );
              },
              icon: Icon(Icons.logout),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text('Profile Page'),
      ),
      body: SafeArea(
          child: Text('Profile Page'),
      ),
    );
  }
}
