import 'package:flutter/material.dart';

class ZuluScreen extends StatefulWidget {
  const ZuluScreen({super.key});

  @override
  _ZuluScreenState createState() => _ZuluScreenState();
}

class _ZuluScreenState extends State<ZuluScreen> {
  final TextEditingController _controller = TextEditingController();
  String feedback = '';
  final String correctAnswer = 'incwadi'; // Example answer for "book" in Zulu

  void checkAnswer() {
    setState(() {
      if (_controller.text.trim().toLowerCase() ==
          correctAnswer.toLowerCase()) {
        feedback = 'Correct!';
      } else {
        feedback = 'Incorrect, try again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zulu Lesson'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/book.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Kubizwa ngani lokhu?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const Text(
              '(English: What is this called?)',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAnswer,
              child: const Text('Submit Answer'),
            ),
            const SizedBox(height: 20),
            Text(
              feedback,
              style: TextStyle(
                fontSize: 18,
                color: feedback == 'Correct!' ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}