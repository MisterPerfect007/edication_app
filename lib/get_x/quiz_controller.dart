import 'dart:convert';

import 'package:education_app/models/quiz_questions_model.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

import '../helpers/dialogs/no_answer.dart';

class QuizController extends GetxController {
  var allQuestions = [].obs;
  var currentQuestionIndex = 0.obs;
  var selectedAnswerIndex = (-1).obs;

  void nextQuestion() {
    if (selectedAnswerIndex.toInt() == (-1)) {
      //show dialog
      print('ooooo');
      NoAnswerDialog();
      return;
    }
      moveToNextQuestion();
  }

  void moveToNextQuestion() {
    if ((currentQuestionIndex.toInt() + 1) < allQuestions.length) {
      currentQuestionIndex.value += 1;
      selectedAnswerIndex.value = (-1);
    }
  }

  void setSelectedAnswerIndex(int index) {
    print('setSelected .... ');
    selectedAnswerIndex.value = index;
  }

  Future getDataFromJson() async {
    final data = await rootBundle.rootBundle
        .loadString('assets/questions/questions.json');
    final jsonData = jsonDecode(data) as List;
    allQuestions.value =
        jsonData.map((data) => QuizQuestionsModel.fromJSON(data)).toList();
  }
}
