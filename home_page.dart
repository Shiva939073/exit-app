import 'ai_interview_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String userName = "";
  int xp = 0;
  int level = 1;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      final userDoc = await _firestore.collection('users').doc(uid).get();
      setState(() {
        userName = userDoc['name'] ?? 'User';
        xp = userDoc['xp'] ?? 0;
        level = userDoc['level'] ?? 1;
      });
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
            Text("Welcome back, \$userName", style: TextStyle(color: Colors.white, fontSize: 24)),
            SizedBox(height: 10),
            Text("XP: \$xp", style: TextStyle(color: Colors.greenAccent, fontSize: 18)),
            Text("Level: \$level", style: TextStyle(color: Colors.blueAccent, fontSize: 18)),
            SizedBox(height: 20),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AIInterviewPage()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  ),
  child: Text("Start AI Interview", style: TextStyle(fontSize: 18)),
),

            ElevatedButton(
    onPressed: () async {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
        await userRef.update({
          'xp': FieldValue.increment(10),
        });
        final updatedDoc = await userRef.get();
        setState(() {
          xp = updatedDoc['xp'] ?? xp;
        });
      }
    },
    child: Text("+10 XP"),
  ),
],

          ],
        ),
      ),
    );
  }
}
