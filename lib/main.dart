import 'package:firebase_1/auth/auth.dart';
import 'package:firebase_1/auth/login_or_register.dart';
import 'package:firebase_1/firebase_options.dart';
import 'package:firebase_1/pages/home_page.dart';
import 'package:firebase_1/pages/profile_page.dart';
import 'package:firebase_1/pages/users_page.dart';
import 'package:firebase_1/theme/dark_mode.dart';
import 'package:firebase_1/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page':(context) => const LoginOrRegister(),
        '/home_page':(context) => const HomePage(),
        '/profile_page':(context) => const ProfilePage(),
        '/users_page':(context) => const UsersPage(),
      },
    );
  }
}

