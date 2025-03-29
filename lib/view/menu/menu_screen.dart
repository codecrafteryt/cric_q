  import 'package:cric_q/view/widgets/custom_button.dart';
  import 'package:flutter/material.dart';
  import '../../utils/values/my_color.dart' show MyColors;
  class QuizHomeScreen extends StatelessWidget {
    const QuizHomeScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.white,
                MyColors.green,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E8572),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Magnifying Glass
                    Transform.rotate(
                      angle: 45 * (3.14159 / 180),
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 15,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00574B),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFFFF9C4),
                                  width: 2,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 25, top: 0),
                              width: 8,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00574B),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFFFF9C4),
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Question Mark
                    Positioned(
                      right: 0,
                      child: Text(
                        "?",
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFF9C4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              // Buttons Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    // Quiz Button
                    CustomButton(
                      text: "QUIZ",
                      onPressed: (){},
                    ),
                    const SizedBox(height: 15),

                    // Top 5 Matches Button
                    CustomButton(text: "Top 5 Matches",
                      onPressed: (){},
                    ),
                    const SizedBox(height: 30),

                    // Options Button
                    CustomButton(text: "Options",
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
