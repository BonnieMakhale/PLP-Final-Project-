import 'package:flutter/material.dart';

void main() {
  runApp(TechKidz());
}

class TechKidz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechKidz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> facts = [
    "The first computer was built in 1943.",
    "The first hard disk drive was created in 1956.",
    "A computer can perform billions of calculations per second.",
    "The word 'computer' was originally used to describe a human who performed calculations.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to TechKidz!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Fun Facts about Computers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: facts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(facts[index]),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Take the Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What does CPU stand for?",
      "options": ["Central Processing Unit", "Computer Personal Unit", "Central Process Unit"],
      "answer": "Central Processing Unit",
    },
    {
      "question": "What is the main function of RAM?",
      "options": ["Store data", "Process data", "Speed up the computer"],
      "answer": "Store data",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechKidz Quiz'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[index]["question"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...questions[index]["options"].map<Widget>((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        // Handle answer selection
                        if (option == questions[index]["answer"]) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Correct!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Try again!')),
                          );
                        }
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
