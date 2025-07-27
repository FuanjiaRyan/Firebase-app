import 'package:firebase_1/Bottom%20Nav%20Bar/activity_page.dart';
import 'package:firebase_1/Bottom%20Nav%20Bar/chat_page.dart';
import 'package:firebase_1/Bottom%20Nav%20Bar/home_page.dart';
import 'package:firebase_1/Bottom%20Nav%20Bar/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  final screens = [
    HomePage(),
    ActivityPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
            backgroundColor: Colors.white,
            selectedFontSize: 13,
            unselectedFontSize: 10,
            selectedItemColor: Colors.greenAccent.shade700,
            unselectedItemColor: Colors.grey.shade700,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                      'assets/home.png',
                    height: 24,
                    width: 24,
                    color: _currentIndex == 0 ? Colors.greenAccent.shade700 : Colors.grey.shade700,
                  ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/activity.png',
                  height: 24,
                  width: 24,
                  color: _currentIndex == 1 ? Colors.greenAccent.shade700 : Colors.grey.shade700,
                ),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/chat.png',
                  height: 24,
                  width: 24,
                  color: _currentIndex == 2 ? Colors.greenAccent.shade700 : Colors.grey.shade700,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/profile.png',
                  height: 24,
                  width: 24,
                  color: _currentIndex == 3 ? Colors.greenAccent.shade700 : Colors.grey.shade700,
                ),
                label: 'Profile',
              ),
            ],
        ),
      ),
    );
  }
}
