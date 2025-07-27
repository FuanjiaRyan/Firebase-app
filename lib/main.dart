import 'package:firebase_1/Bottom%20Nav%20Bar/bottom_nav_bar_screen.dart';
import 'package:firebase_1/firebase_options.dart';
import 'package:firebase_1/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with error handling for duplicate app
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // If Firebase is already initialized, continue
    if (e.toString().contains('duplicate-app')) {
      print('Firebase already initialized, continuing...');
    } else {
      rethrow;
    }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      debugShowCheckedModeBanner: false,

      //Code to prevent the user from opening the home page after closing the app
      home: user != null ? BottomNavBarScreen() : WelcomeScreen(),
    );
  }
}
