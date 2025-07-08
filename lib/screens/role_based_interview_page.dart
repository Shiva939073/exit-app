
import 'package:flutter/material.dart';

class RoleBasedInterviewPage extends StatefulWidget {
  const RoleBasedInterviewPage({super.key});

  @override
  _RoleBasedInterviewPageState createState() => _RoleBasedInterviewPageState();
}

class _RoleBasedInterviewPageState extends State<RoleBasedInterviewPage> {
  String selectedRole = 'Film Making';
  final Map<String, List<String>> questions = {
    'Film Making': [
      'What’s your favorite genre and why?',
      'Explain how you’d shoot a 3-minute short film.',
    ],
    'Programming': [
      'What’s the difference between an API and a library?',
      'Explain a project where you used Flutter or React.',
    ],
    'Business': [
      'What’s your business idea?',
      'How would you attract your first 100 users?',
    ],
  };

  int currentQuestionIndex = 0;
  List<String> currentAnswers = [];

  @override
  Widget build(BuildContext context) {
    List<String> currentQuestions = questions[selectedRole]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Interview by Role'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue!;
                  currentQuestionIndex = 0;
                  currentAnswers.clear();
                });
              },
              items: questions.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(currentQuestions[currentQuestionIndex]),
            const SizedBox(height: 20),
            TextField(
              onChanged: (val) {
                if (currentAnswers.length > currentQuestionIndex) {
                  currentAnswers[currentQuestionIndex] = val;
                } else {
                  currentAnswers.add(val);
                }
              },
              decoration: const InputDecoration(labelText: 'Your Answer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentQuestionIndex < currentQuestions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    // End of interview
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Interview Complete'),
                        content: const Text('Your answers were submitted successfully.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  }
                });
              },
              child: const Text('Next Question'),
            )
          ],
        ),
      ),
    );
  }
}
