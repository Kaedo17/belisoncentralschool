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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(tabs: [
        GButton(icon: Icons.home,
        text: 'Home',
        ),
        GButton(icon: Icons.chat,
        text: "Message",
        ),
        GButton(icon: Icons.person_rounded,
        text: "Profile",
        ),
        GButton(icon: Icons.logout, 
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