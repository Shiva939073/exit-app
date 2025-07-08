
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Login error: \$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 24)),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white))),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.white))),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
