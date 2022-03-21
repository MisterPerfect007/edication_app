import 'package:education_app/get_x/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final QuizController _quizController = Get.put(QuizController());

  bool isLastQuestion = false;

  @override
  void initState() {
    _quizController.currentQuestionIndex.listen((p0) {
      setState(() {
        isLastQuestion = _quizController.allQuestions.length == _quizController.currentQuestionIndex.toInt() + 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey.shade400,
                blurRadius: 20)
          ]),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Mopo"),
              SizedBox(height: 5,),
              Text("1 / 3 questions")
            ],
          ),
          Expanded(child: Container()),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isLastQuestion? Colors.green.shade500 : null
              ),
              onPressed: () {
                _quizController.nextQuestion();
                
              },
              child: Text( isLastQuestion? 'Finir' : 'Suivant' ),
              ),
          )
        ],
      ),
    );
  }
}
