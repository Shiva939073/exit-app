import 'package:flutter/material.dart';
import 'role_selection_page.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose Your Mode",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoleSelectionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text("🚀 Start My Journey", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

