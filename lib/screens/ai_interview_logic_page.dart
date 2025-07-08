
import 'package:flutter/material.dart';

class AIInterviewLogicPage extends StatefulWidget {
  const AIInterviewLogicPage({super.key});

  @override
  State<AIInterviewLogicPage> createState() => _AIInterviewLogicPageState();
}

class _AIInterviewLogicPageState extends State<AIInterviewLogicPage> {
  String question = "Tell me about your passion in your chosen field.";
  String selectedLanguage = "English";

  void nextQuestion() {
    setState(() {
      question = "What challenges did you overcome in this journey?";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("AI Interview", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Language:", style: TextStyle(color: Colors.white, fontSize: 16)),
            DropdownButton<String>(
              value: selectedLanguage,
              dropdownColor: Colors.black,
              items: <String>['English', 'Telugu', 'Hindi', 'Tamil'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
            ),
            const SizedBox(height: 30),
            Text(
              question,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text("Next Question"),
            )
          ],
        ),
      ),
    );
  }
}
