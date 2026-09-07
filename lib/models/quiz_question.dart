class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final sl = List.of(answers);
    sl.shuffle();
    return sl;
  }
}
