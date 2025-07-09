import 'package:flutter/material.dart';

class AIInterviewPage extends StatelessWidget {
  final String role;

  const AIInterviewPage({required this.role, super.key});
  String getFirstQuestion(String role) {
  switch (role) {
    case 'Filmmaker':
      return '🎬 What inspired you to become a filmmaker?';
    case 'Doctor':
      return '🩺 Why did you choose medicine as a career?';
    case 'Freelancer':
      return '💼 How do you find your first clients?';
    case 'Software Developer':
      return '💻 What languages and frameworks do you prefer?';
    case 'Engineer':
      return '🛠 Tell me about your most exciting project.';
    case 'Fashion Designer':
      return '👗 How do you approach designing a new collection?';
    case 'Teacher':
      return '📚 What teaching style do you believe in?';
    case 'Actor':
      return '🎭 Which role challenged you the most?';
    case 'Chef':
      return '🍲 What’s your signature dish and why?';
    default:
      return '🧠 Tell me about yourself.';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("AI Interview"),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose Your Role",
              style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 10),
            Text(
  'Interview for: $role',
  style: TextStyle(color: Colors.white, fontSize: 24),
),
SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1D1E33),
                border: OutlineInputBorder(),
              ),
              dropdownColor: Color(0xFF1D1E33),
              items: ["Filmmaker", "Freelancer", "Labor", "Doctor", "Engineer"]
                .map((role) => DropdownMenuItem(value: role, child: Text(role, style: TextStyle(color: Colors.white))))
                .toList(),
              onChanged: (val) {},
            ),
            SizedBox(height: 20),
            Text("Choose Language",
              style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1D1E33),
                border: OutlineInputBorder(),
              ),
              dropdownColor: Color(0xFF1D1E33),
              items: ["English", "Telugu", "Hindi", "French", "Spanish"]
                .map((lang) => DropdownMenuItem(value: lang, child: Text(lang, style: TextStyle(color: Colors.white))))
                .toList(),
              onChanged: (val) {},
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Logic to launch AI interview
                },
                child: Text("Start Interview", style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
