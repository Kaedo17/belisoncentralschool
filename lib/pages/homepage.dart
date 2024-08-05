import 'package:belisoncentralschool/pages/new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // logout
  void logout() async {
      await FirebaseAuth.instance.signOut();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        duration: Duration(milliseconds: 100),
        selectedIndex: _selectedIndex,
        tabs: [
        
        GButton(icon: Icons.home,
        gap: 10,
        text: 'Home',
        ),
        GButton(icon: Icons.chat,
        gap: 10,
        text: "Message",
        ),
        GButton(icon: Icons.person_rounded,
        gap: 10,
        text: "Profile",
        ),
        GButton(icon: Icons.logout, 
        gap: 10,
        onPressed: logout,
        text: "Logout",
        ),
      ]),

      body: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}