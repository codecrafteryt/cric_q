  import 'package:get/get.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:cric_q/view/quiz/quiz1_screen/quiz1_screen.dart';

import '../view/quiz/quiz2_screen/quiz2_screen.dart';
import '../view/quiz/quiz3_screen/quiz3_screen.dart';
import '../view/quiz/quiz4_screen/quiz4_screen.dart';
  // Import other quiz screens as needed

  class QuizSelectionController extends GetxController {
    var quizUnlocked = [true, false, false, false].obs; // Quiz 1 is always unlocked

    @override
    void onInit() {
      super.onInit();
      loadQuizStatus();
    }

    Future<void> loadQuizStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Quiz 1 is always unlocked
      quizUnlocked[0] = true;

      // Check if each quiz is unlocked (a quiz is unlocked if the previous one is completed)
      for (int i = 2; i <= 4; i++) {
        bool isPreviousCompleted = prefs.getBool('quiz_${i-1}_completed') ?? false;
        quizUnlocked[i-1] = isPreviousCompleted;
      }

      update(); // Update the UI with the new values
    }

    void navigateToQuiz(int quizNumber) {
      switch (quizNumber) {
        case 1:
          Get.to(() => Quiz1Screen());
          break;
        case 2:
          Get.to(() => Quiz2Screen());
          break;
        case 3:
          Get.to(() => Quiz3Screen());
          break;
        case 4:
          Get.to(() => Quiz4Screen());
          break;
      }
    }
  }