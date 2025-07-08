
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signup() async {
    try {
      final UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await _firestore.collection('users').doc(userCred.user!.uid).set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'uid': userCred.user!.uid,
        'joinedAt': Timestamp.now(),
        'xp': 0,
        'level': 1,
        'role': '',
      });

      Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => HomePage()),
);
    } catch (e) {
      print('Signup error: \$e');
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
            Text("Create Your Identity", style: TextStyle(color: Colors.white, fontSize: 24)),
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name', labelStyle: TextStyle(color: Colors.white))),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white))),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.white))),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _signup, child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
