import 'dart:convert';

import 'package:education_app/models/quiz_questions_model.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

class QuizController extends GetxController{
  var allQuestions = [].obs;
  var currentQuestionIndex = 0.obs;

  void nextQuestion() {
    if((currentQuestionIndex.toInt() + 1) < allQuestions.length) {
      print('currentIndex: $currentQuestionIndex');
      currentQuestionIndex.value += 1;
    }
  }

  Future getDataFromJson() async {
    final data = await rootBundle.rootBundle.loadString('assets/questions/questions.json');
    final jsonData = jsonDecode(data) as List;
    allQuestions.value = jsonData.map((data) => QuizQuestionsModel.fromJSON(data)).toList();
  }
  
}

