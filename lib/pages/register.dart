
import 'package:belisoncentralschool/components/my_button.dart';
import 'package:belisoncentralschool/components/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final void Function()? onTap;

  
  RegisterPage({super.key, required this.onTap});

  // Text Editing Controller

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpwdController = TextEditingController();


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
        
              Icon(Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
        
              const SizedBox(height: 15),
        
              // logo name
        
              Text(
                'B E L I S O N  C E N T R A L \nS C H O O L', 
                style: TextStyle(fontSize: 20), 
                textAlign: TextAlign.center,),
        
              const SizedBox(height: 30),

              // username

              MyTextfield(
                hintText: 'Username', 
                obscureText: false, 
                controller: usernameController),
              
              const SizedBox(height: 15,),
              
        
              // email
        
              MyTextfield(
                hintText: 'Email', 
                obscureText: false, 
                controller: emailController),
              
              const SizedBox(height: 15,),
              // password

        


              MyTextfield(
                hintText: 'Confirm Password', 
                obscureText: true, 
                controller: confirmpwdController),

              // confirm password

                    SizedBox(height: 15,),

              MyTextfield(
                hintText: 'Email', 
                obscureText: false, 
                controller: emailController),
              
              const SizedBox(height: 15,),

              MyTextfield(
                hintText: 'Password', 
                obscureText: true, 
                controller: passwordController),

              // forgot password
SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?'),
                ],
              ),
              // sign in
          SizedBox(height: 30,),
              MyButton(text: 'Register'),

              // make account
SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.w100
                  ),
                  ),

                  GestureDetector(
                    onTap: onTap,
                    child: const Text(" Login here!", style: TextStyle(fontWeight: FontWeight.w700),
                    
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