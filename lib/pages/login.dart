
import 'package:belisoncentralschool/components/my_button.dart';
import 'package:belisoncentralschool/components/textfield.dart';
import 'package:belisoncentralschool/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  
  final void Function()? onTap;

 
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   // Text Editing Controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void login() async{
    //show loading circle

    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // try signing in

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      //pop circle

      if (context.mounted) Navigator.pop(context);
    }

    
      on FirebaseAuthException catch (e) {
        // pop circle
        Navigator.pop(context);
        // show message
        displayMessageToUser(e.code, context);
      }
        
            
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo

              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 15),

              // logo name

              Text(
                'B E L I S O N  C E N T R A L \nS C H O O L',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // email

              MyTextfield(
                  hintText: 'Email',
                  obscureText: false,
                  controller: emailController),

              const SizedBox(
                height: 15,
              ),
              // password

              MyTextfield(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController),

              // forgot password
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?'),
                ],
              ),
              // sign in
              SizedBox(
                height: 30,
              ),
              MyButton(
                text: 'Login',
                ontap: login,
              ),

              // make account
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      " Register here!",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
