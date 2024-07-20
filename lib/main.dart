
import 'package:belisoncentralschool/auth/login_or_register.dart';
import 'package:belisoncentralschool/themes/dark_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginOrRegister(),
      
      theme: darkMode,

      darkTheme: darkMode,
    );
  }
}