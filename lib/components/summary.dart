import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.summary, {super.key});
  final Map<String, Object> summary;

  @override
  Widget build(BuildContext context) {
    final isCorrect = summary["user_correct"] as bool;
    final questionIndex = summary["question_index"] as int;
    return Column(
      children: [
        if (questionIndex != 0)
          const Divider(
            color: Colors.black87,
            thickness: 1,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${questionIndex + 1}',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    summary["question"] as String,
                    style: GoogleFonts.ubuntu(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your answer: ${summary["user_answer"] as String}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: isCorrect ? Colors.green : Colors.red,
                      backgroundColor: isCorrect ? Colors.black87 : null,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Correct answer: ${summary["correct_answer"] as String}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
