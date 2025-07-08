import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';

class SelectModePage extends StatelessWidget {
  Future<void> guestLogin(BuildContext context) async {
    try {
      final UserCredential userCred = await FirebaseAuth.instance.signInAnonymously();

      await FirebaseFirestore.instance.collection('users').doc(userCred.user!.uid).set({
        'name': 'Guest User',
        'email': '',
        'uid': userCred.user!.uid,
        'joinedAt': Timestamp.now(),
        'xp': 0,
        'level': 1,
        'role': 'guest',
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } catch (e) {
      print('Guest login error: \$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CHOOSE YOUR PATH", style: TextStyle(color: Colors.white, fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
            }, child: Text("Login")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SignupPage()));
            }, child: Text("Sign Up")),
            ElevatedButton(onPressed: () => guestLogin(context), child: Text("Continue as Guest")),
          ],
        ),
      ),
    );
  }
}
