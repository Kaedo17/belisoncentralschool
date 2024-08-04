import 'package:belisoncentralschool/components/my_button.dart';
import 'package:belisoncentralschool/components/textfield.dart';
import 'package:belisoncentralschool/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text Editing Controller
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpwdController = TextEditingController();

  // register User
  void registerUser() async {
    // show loading cirlce

    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // make password match
    if (passwordController.text != confirmpwdController.text) {
      // pop loading screen
      Navigator.pop(context);

      // show error message
      displayMessageToUser("Password don't match!", context);
    } else {

      try {
        // create the user
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        // pop loading cirlce
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop circle
        Navigator.pop(context);

        // show message
        displayMessageToUser(e.code, context);
      }
  }
  
    }

      // try creating new user

      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
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
          
                  // username
          
                  MyTextfield(
                      hintText: 'Username',
                      obscureText: false,
                      controller: usernameController),
          
                  const SizedBox(
                    height: 15,
                  ),
          
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
          
                  // confirm password
          
                  const SizedBox(
                    height: 15,
                  ),
          
                  MyTextfield(
                      hintText: 'Confirm Password',
                      obscureText: true,
                      controller: confirmpwdController),
          
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
                    text: 'Register',
                    ontap: registerUser,
                  ),
          
                  // make account
                  SizedBox(
                    height: 15,
                  ),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          " Login here!",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
