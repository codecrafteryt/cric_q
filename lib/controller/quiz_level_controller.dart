import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cric_q/view/quiz/quiz1_screen/quiz1_result_screen.dart';
import 'package:cric_q/view/quiz/quiz2_screen/quiz2_result_screen.dart';

import '../view/quiz/quiz3_screen/quiz3_result_screen.dart';
import '../view/quiz/quiz4_screen/quiz4_result_screen.dart';
import '../view/top_matches/match_detail_screen.dart';

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

class QuizLevelController extends GetxController {

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    currentQuestionIndex.value = 0;
    selectedAnswer.value = -1;
    correctAnswersCount.value = 0;
    pageController.dispose();
  }
  // Questions for Quiz 1
  final questionsForQuiz1 = [
    QuizQuestion(
      question: "Which cricketer has scored the most ducks at the ODI World Cup for India as of 2023?",
      options: ["Krishnamachari Srikkanth", "Ajit Agarkar", "Sachin Tendulkar", "Javagal Srinath"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "During the 'Wills World Cup' of 1996, India was eliminated at the stage of?",
      options: ["Semi-Finals", "Group Matches", "Finals", "Quarter-Finals"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Who was the highest wicket-taker for India at the 2015 ODI World Cup?",
      options: ["Umesh Yadav", "Anil Kumble", "Mohammed Shami", "Zaheer Khan"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "How many runs did India make in its historic World Cup win over West Indies in 1983?",
      options: ["183", "192", "234", "263"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "In which year were the World Cup matches reduced to 50 overs from the previous 60 overs?",
      options: ["1987", "1983", "1982", "1984"],
      correctAnswerIndex: 0,
    ),
  ];

  // Questions for Quiz 2
  final questionsForQuiz2 = [
    QuizQuestion(
      question: "As of 2019, which cricketer has the best bowling figures in an innings at the ODI World Cup for India?",
      options: ["Ashish Nehra", "Ajit Agarkar", "Venkatesh Prasad", "Javagal Srinath"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Who was the highest wicket-taker for India during the historic 1983 Prudential World Cup held in England?",
      options: ["Roger Binny", "Ravi Shashtri", "Sandeep Patil", "Kapil Dev"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Who was the Indian player who never represented India in any international game but still got selected for the 1983 World Cup?",
      options: ["Sunil Valson", "Bharath Reddy", "Sunil Kirti Azad", "Eknath Solkar"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question:  "How much did Sunil Gavaskar score for India in its very first World Cup match played against England in 1975?",
      options: ["36 off 174 balls", "36 off 37 balls", "76 off 174 balls", "111 off 100 balls"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Against which country did India win with the most significant margin by runs in a World Cup as of 2023?",
      options: ["Sri Lanka", "Namibia", "Australia", "Bermuda"],
      correctAnswerIndex: 0,
    ),
  ];

  final questionsForQuiz3 = [
    QuizQuestion(
      question: "Which cricketer has scored the most ducks at the ODI World Cup for India as of 2023?",
      options: ["Krishnamachari Srikkanth", "Ajit Agarkar", "Sachin Tendulkar", "Javagal Srinath"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "During the 'Wills World Cup' of 1996, India was eliminated at the stage of?",
      options: ["Semi-Finals", "Group Matches", "Finals", "Quarter-Finals"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Who was the wicket-keeper of the Indian Cricket Team during the World Cup 2003 tournament?",
      options: ["Rahul Dravid", "Parthiv Patel", "Nayan Mongia", "Mahendra Singh Dhoni"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question:  "As of 2023, what is the lowest score defended in an ODI World Cup final?",
      options: ["183", "192", "234", "263"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Who was the captain of the Indian team during the first World Cup in England in 1975?",
      options: ["Srinivasaraghavan Venkataraghavan", "Abid Ali", "Sunil Gavaskar", "Gundappa Viswanath"],
      correctAnswerIndex: 0,
    ),
  ];

  final questionsForQuiz4 = [
    QuizQuestion(
      question: "Kapil Dev did not play for India during the World Cup tournament held in:",
      options: ["1975", "1979", "1983", "1987"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Which cricketer hit the most number of centuries in a single ODI World Cup up until 2019?",
      options: ["Rohit Sharma", "Virat Kohli", "Sachin Tendulkar", "Ricky Ponting"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "Who was the highest wicket-taker for India at the 2015 ODI World Cup?",
      options: ["Umesh Yadav", "Anil Kumble", "Mohammed Shami", "Zaheer Khan"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question:  "Which cricketer has made the highest individual score at the World Cup for India?",
      options: ["Sourav Ganguly", "Kapil Dev", "Rahul Dravid", "Sachin Tendulkar"],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: "In which year were the World Cup matches reduced to 50 overs from the previous 60 overs?",
      options: ["1987", "1983", "1982", "1984"],
      correctAnswerIndex: 0,
    ),
  ];

  // Active questions based on current quiz level
  var questions = <QuizQuestion>[].obs;
  var currentQuizLevel = 1.obs;
  var currentQuestionIndex = 0.obs;
  var selectedAnswer = (-1).obs;
  var correctAnswersCount = 0.obs;

  // Quiz unlock status
  var quizUnlocked = [true, false, false, false].obs; // Quiz 1 is always unlocked

  @override
  void onInit() {
    super.onInit();
    loadQuizStatus();
  }

  // Load questions based on quiz level
  void loadQuestionsForLevel(int level) {
    currentQuizLevel.value = level;
    currentQuestionIndex.value = 0;
    selectedAnswer.value = -1;
    correctAnswersCount.value = 0;

    switch (level) {
      case 1:
        questions.value = questionsForQuiz1;
        break;
      case 2:
        questions.value = questionsForQuiz2;
        break;
      case 3:
        questions.value = questionsForQuiz3;
        break;
      case 4:
        questions.value = questionsForQuiz4;
        break;
        default:
        questions.value = questionsForQuiz1;
    }
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

    update(); // Update the UI
  }

  /// Check if the selected answer is correct
  bool isAnswerCorrect() {
    return selectedAnswer.value == questions[currentQuestionIndex.value].correctAnswerIndex;

  }

  /// Store quiz result and completion status in SharedPreferences
  Future<void> saveQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the quiz score
    await prefs.setInt('quiz_${currentQuizLevel.value}_score', correctAnswersCount.value);

    // Mark this quiz as completed
    await prefs.setBool('quiz_${currentQuizLevel.value}_completed', true);

    // Unlock the next quiz
    if (currentQuizLevel.value < 4) {
      await prefs.setBool('quiz_${currentQuizLevel.value+1}_unlocked', true);

      // Reload quiz status to update the UI
      await loadQuizStatus();
    }
  }

  /// Move to next question or show results
  void nextQuestion() async {
    if (selectedAnswer.value == -1) return; // Prevent going to next question without selection

    if (isAnswerCorrect()) {
      correctAnswersCount.value++; // Increase score if answer is correct
    }

    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = -1; // Reset selection for next question
    } else {
      // This was the last question
      await saveQuizResult();
      // Navigate to appropriate result screen based on quiz level
      switch (currentQuizLevel.value) {
        case 1:
          Get.to(() => Quiz1ResultScreen());
          break;
        case 2:
          Get.to(() => Quiz2ResultScreen());
          break;
        case 3:
          Get.to(() => Quiz3ResultScreen());
        case 4:
          Get.to(() => Quiz4ResultScreen());
      }
    }
  }

  final PageController pageController = PageController();
  var currentPage = 0.obs;

  // List of match details
  final List<Map<String, String>> matches = [
    {
      "image": "assets/images/1match.png",
      "title": "India vs South Africa - ICC World Cup 2015",
      "viewers": "300 Million Viewers",
      "story": "The 2015 ICC World Cup Group B match between India and South Africa was a showdown of epic proportions. While India were the defending champions, the Proteas were being touted as the favourites to clinch the victory. However, the Indian cricket team, led by the enigmatic MS Dhoni, defied the odds and emerged victorious. With Shikhar Dhawan leading the charge with an explosive 137 runs, the Indian team posted a mammoth total of 307 runs in their allotted 50 overs, leaving the opposition reeling.  Ajinkya Rahane's quickfire 79 runs provided the necessary support to Dhawan's spectacular innings, further cementing the Indian team's dominance. In response, the South African team's batting line-up crumbled under the pressure of the Indian bowlers, with Ravichandran Ashwin leading the charge and bagging three wickets for a mere 41 runs whereas Mohammed Shami and Mohit Sharma bagged two wickets apiece. The Proteas could only muster a measly 177 runs in their innings, leading to a resounding 130 run victory for the Indian team."
    },
    {
      "image": "assets/images/2match.png",
      "title": "India vs Pakistan - ICC World Cup 2011",
      "viewers": "400 Million Viewers",
      "story": "The stage was set for the ultimate showdown in cricket as the two bitter rivals, India and Pakistan, clashed in the pinnacle of ODI cricket – the 2015 World Cup.  Indian skipper, MS Dhoni, won the toss and elected to bat first. Opener Shikhar Dhawan provided a solid foundation with a fine knock of 73, setting the stage for Virat Kohli to unleash his brilliance on the pitch.  Kohli's magnificent ton laid the foundation for the Indian team to amass a daunting total of 300 runs. Suresh Raina added to the mayhem with a blistering 74, providing the ideal finish to the innings. In the run chase, Pakistan's batting line-up crumbled under the pressure of the Indian bowling attack. Skipper Misbah-ul-Haq waged a lone battle with a gritty knock of 76, but it was not enough to keep the team in the hunt as he ran out of partners.  The team was bundled out for a paltry 224 runs in 47 overs, leaving the Indian team with a resounding victory. Shami was the pick of the bowlers with impressive figures of 4/35."
    },
    {
      "image": "assets/images/3match.png",
      "title": "Australia vs England - Ashes 2005",
      "viewers": "200 Million Viewers",
      "story": "As the Champions Trophy 2017 rolled into Edgbaston, fans around the world geared up for the ultimate showdown between two cricketing giants. The Indian team displayed their dominance, leaving the opposition in disarray from the word go as the top four batters, Shikhar Dhawan, Rohit Sharma, Virat Kohli, and Yuvraj Singh, were in sublime form, each scoring a magnificent fifty to propel the team to a total in excess of 300 runs.  The Pakistani bowlers were helpless in the face of the Indian onslaught, as the men in blue set a daunting target for the opposition. In the run chase, the Pakistani team appeared to be completely clueless, unable to mount any meaningful resistance against the Indian bowlers. They were eventually bundled out for a meager score of under 170 runs, suffering a crushing defeat by a margin of 124 runs by the DLS method."
    },
    {
      "image": "assets/images/4match.png",
      "title": "West Indies vs India - T20 2016",
      "viewers": "250 Million Viewers",
      "story": "The cricketing world came to a standstill as the most hyped game of the tournament unfolded at Mohali, pitting two fierce rivals – India and Pakistan – against each other in the semi-final of the ICC World Cup 2011. The Indian team relied on the batting prowess of the batting maestro, Sachin Tendulkar, to lead the charge, and he did not disappoint. Tendulkar's brilliant knock of 85 runs off 115 balls provided the backbone of the Indian innings, helping them reach a total of 260 runs despite other batsmen failing to convert their starts into big scores. In a game where every run mattered, it was the Indian bowlers who stepped up to the occasion and defended the below-par total. Pakistan's batting lineup, in contrast, struggled to keep up with the required run rate, eventually being bundled out for a meager total of 231 runs. "
    },
    {
      "image": "assets/images/5match.png",
      "title": "India vs Sri Lanka - World Cup Final 2011",
      "viewers": "350 Million Viewers",
      "story": "Back in 2011, the world's cricketing eyes were set on the biggest event of the year – the ICC World Cup finals. The Indian team had powered their way into the finals, set to face off against the co-hosts Sri Lanka. Sri Lanka had set a formidable target of 274 runs on the board, courtesy of a valiant century by Mahela Jayawardene. To end their country's 28-year wait for the trophy, the Indian team needed to pull off a record-breaking run chase. Led by the stalwart MS Dhoni, the Indian team etched their name in the annals of cricketing history with a thrilling and unforgettable performance. The Indian captain himself played a captain's knock with an unbeaten 91*. Gautam Gambhir's steady innings of 97 runs provided the necessary anchor to Dhoni's pyrotechnics as India went on to win the World Cup. It was a historic game, watched by millions around the world, and it cemented its place in the record books as the most viewed cricket game ever played."
    },
  ];

  void nextPage() {
    if (currentPage.value < matches.length - 1) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.animateToPage(
        currentPage.value - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void openMatchStory() {
    Get.to(() => MatchDetailsScreen(
      title: matches[currentPage.value]["title"]!,
      story: matches[currentPage.value]["story"]!,
      image: matches[currentPage.value]["image"]!,
    ));
  }
}