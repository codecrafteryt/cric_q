/*
    ---------------------------------------
    Project: Plinkos Puzzle Game Mobile Application
    Date: March 29, 2024
    Author: Ameer from Pakistan
    ---------------------------------------
    Description: Model code
  */

import 'package:cric_q/data/model/quiz_questions.dart';

  class Quiz {
      final int id;
      final String title;
      final List<QuizQuestion> questions;
      bool isUnlocked;
      bool isCompleted;

      Quiz({
        required this.id,
        required this.title,
        required this.questions,
        this.isUnlocked = false,
        this.isCompleted = false,
      });
    }