import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/components/button.dart';
import 'package:quizz_app/components/summary.dart';
import 'package:quizz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, this.callback, {super.key});

  final List<String> selectedAnswers;
  final void Function() callback;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": selectedAnswers[i],
          "user_correct": selectedAnswers[i] == questions[i].answers[0]
              ? true
              : false,
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final data = getSummaryData();
    final numTotal = questions.length;
    final numCorrect = data.where((summary) {
      return summary["correct_answer"] == summary["user_answer"];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You answered $numCorrect out of $numTotal questions correctly!",
              style: GoogleFonts.ubuntu(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...data.map((data) {
                      return Summary(data);
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Button(
              text: "Restart Quiz!",
              callback: callback,
            ),
          ],
        ),
      ),
    );
  }
}
