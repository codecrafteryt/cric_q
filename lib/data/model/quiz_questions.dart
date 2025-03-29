  /*
      ---------------------------------------
      Project: Plinkos Puzzle Game Mobile Application
      Date: March 29, 2024
      Author: Ameer from Pakistan
      ---------------------------------------
      Description: Question model code
    */

  // Quiz Question Model
  class QuizQuestion {
    final String question;
    final List<String> options;
    final int correctAnswerIndex;

    QuizQuestion({
      required this.question,
      required this.options,
      required this.correctAnswerIndex,
    });
  }