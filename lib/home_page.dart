import 'package:firebase_1/Auth%20Services/auth_service.dart';
import 'package:firebase_1/login&signup%20page/signup_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () async{
                await _authService.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
