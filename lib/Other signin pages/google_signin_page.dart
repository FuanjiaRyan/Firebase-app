import 'package:flutter/material.dart';

class GoogleSigninPage extends StatefulWidget {
  const GoogleSigninPage({super.key});

  @override
  State<GoogleSigninPage> createState() => _GoogleSigninPageState();
}

class _GoogleSigninPageState extends State<GoogleSigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Text('Google Sign in Page'),
    );
  }
}
