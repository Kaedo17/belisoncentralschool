
import 'package:belisoncentralschool/auth/auth.dart';
import 'package:belisoncentralschool/auth/login_or_register.dart';
import 'package:belisoncentralschool/firebase_options.dart';
import 'package:belisoncentralschool/themes/dark_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const AuthPage(),
      
      theme: darkMode,

      darkTheme: darkMode,
    );
  }
}