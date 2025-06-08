import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.person, size: 250, color: Color(0x772C00FF)),
                  // SizedBox(height: 10,),
                  Text(
                    'Ryan Puzo',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0x772C00FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter username',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: 'Enter username',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: 'Enter email',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: 'Enter password',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
