import 'package:education_app/get_x/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choice_question.dart';

class QuestionChoices extends StatefulWidget {
  const QuestionChoices({Key? key}) : super(key: key);

  @override
  State<QuestionChoices> createState() => _QuestionChoicesState();
}

class _QuestionChoicesState extends State<QuestionChoices> {
  dynamic _selectedAnswerIndex;
  void _setSelectedAnswerIndex(index) {
    setState(() {
      _selectedAnswerIndex = index;
    });
  }

  int questionIndex = 0;

  final QuizController _quizController = Get.put(QuizController());

  @override
  void initState() {
    _quizController.getDataFromJson();
    super.initState();
    _quizController.currentQuestionIndex.listen((p0) {
      setState(() {
        questionIndex = _quizController.currentQuestionIndex.toInt();
        
      });
      print(questionIndex);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // print('List: ${_quizController.allQuestions.toList()}');
    return Obx(() => _quizController.allQuestions.isNotEmpty ?  ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount:  4,
      itemBuilder: ((context, index) {
        
        return  Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          // height: 100,
          child: QuestionChoice(
              question: _quizController.allQuestions[questionIndex].choices[index],
              selectedAnswerIndex: _selectedAnswerIndex,
              answerIndex: index,
              setSelectedAnswerIndex: _setSelectedAnswerIndex),
        );
      }),
    ) : Container());
  }
}
