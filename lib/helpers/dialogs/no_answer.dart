import 'package:education_app/get_x/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> NoAnswerDialog() {
  final QuizController _quizController = Get.put(QuizController());
  return Get.defaultDialog(
      radius: 5,
      title: "Attention",
      cancel: Container(
        margin: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed:() {
            Get.back();
          },
          child: Text('Non'),
          ),
      ),
      confirm: ElevatedButton(
        onPressed:() {
          _quizController.moveToNextQuestion();
          Get.back();
        },
        child: Text('Passer'),
        ),
      content: Column(
        children: const [
          Text(
            'Vous aurez 0 si vous passer à la question suivante sans répondre.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            ),
          SizedBox(height: 10,),
          Text(
            'Voulez vous passez ?',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18
            ),
            ),
        ],
      ),
      titleStyle: const TextStyle(color: Colors.red));
      
}
