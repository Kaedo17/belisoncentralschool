import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  
  const MyTextfield(
      {super.key, required this.hintText, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(

          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          
          borderRadius: BorderRadius.circular(15),
          
          
        ),
        hintText: hintText,
      ),
      obscureText: obscureText,
    );
  }
}
