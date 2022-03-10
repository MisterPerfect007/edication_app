import 'dart:async';

import 'package:education_app/get_x/quiz_controller.dart';
import 'package:education_app/screens/quiz/widget/bottom_bar.dart';
import 'package:education_app/screens/quiz/widget/choice_questions.dart';
import 'package:education_app/screens/quiz/widget/quiz_app_bar.dart';
import 'package:education_app/screens/quiz/widget/remaining_time_progressbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final QuizController _quizController = Get.put(QuizController());

  String question = '';
  int questionIndex = 0;
  List allQuestions = [];
  @override
  void initState() {
    questionIndex = _quizController.currentQuestionIndex.toInt();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {
          question = _quizController.allQuestions.isNotEmpty
              ? _quizController.allQuestions[questionIndex].question
              : '',
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _quizController.currentQuestionIndex.listen((p0) {
      setState(() {
        question = _quizController
            .allQuestions[_quizController.currentQuestionIndex.toInt()]
            .question;
        questionIndex = _quizController.currentQuestionIndex.toInt();
      });
    });
    _quizController.allQuestions.listen((p0) {
      allQuestions = _quizController.allQuestions;
      setState(() {
        question = _quizController.allQuestions[questionIndex].question;
      });
    });
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: const QuizAppBar(),
        ),
        backgroundColor: const Color(0xfff9fafb),
        bottomNavigationBar: BottomBar(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RemainingTimeProgressbar(),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 15, left: 15, right: 15),
                          child: Text(
                            'QUESTION ${questionIndex + 1} SUR ${allQuestions.length}',
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 30, left: 15, right: 15),
                        child: Text(
                          question,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: const [
                              Expanded(child: QuestionChoices()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
