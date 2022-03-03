import 'dart:async';

import 'package:education_app/screens/quiz/widget/choice_questions.dart';
import 'package:education_app/screens/quiz/widget/quiz_app_bar.dart';
import 'package:education_app/screens/quiz/widget/remaining_time_progressbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: const QuizAppBar(),
        ),
        body: Container(
          color: const Color.fromARGB(255, 242, 242, 242),
          child: Column(
            children: [
              const RemainingTimeProgressbar(),
              Container(
                  padding: EdgeInsets.only(top: 30, bottom: 15),
                  child: Text(
                    'QUESTION 30 SUR 30',
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  )),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 30),
                child: Text(
                  'La question vous devez repondre ?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      QuestionChoices(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
