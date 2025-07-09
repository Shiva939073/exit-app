import 'package:flutter/material.dart';
import 'ai_interview_page.dart'; // import the AI interview page

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> roles = [
      'Filmmaker',
      'Software Developer',
      'Chef',
      'Fashion Designer',
      'Construction Worker',
      'Doctor',
      'Teacher',
      'Actor',
      'Dancer',
      'Freelancer',
      'Business Owner',
      'Investor',
      'Labor',
      'Any Skill-Based Role'
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Choose Your Role')),
      body: ListView.builder(
        itemCount: roles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(roles[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AIInterviewPage(role: roles[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
