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

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    News(),

    Center(
      child: Text('si'),
    ),

    Center(
      child: Text('kaloy'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      
      
      body: _pages[_selectedIndex],

      bottomNavigationBar: Container(
        
        color: Color.fromARGB(255, 20, 19, 19),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: GNav(
            //backgroundColor: Color.fromARGB(255, 20, 19, 19),
            
              
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.all(16),
              tabBackgroundColor: Theme.of(context).colorScheme.surface,
              selectedIndex: _selectedIndex,
              onTabChange: _navigateBottomBar,
              tabs: [
                GButton(
                  icon: Icons.home,
                  gap: 10,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.chat,
                  gap: 10,
                  text: "Message",
                ),
                GButton(
                  icon: Icons.person_rounded,
                  gap: 10,
                  text: "Profile",
                ),
                GButton(
                  icon: Icons.logout,
                  gap: 10,
                  onPressed: logout,
                  text: "Logout",
                ),
              ]),
        ),
      ),

    );
  }
}
