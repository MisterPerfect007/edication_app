
import 'package:education_app/get_x/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionChoice extends StatelessWidget {
  final String question;
  final int answerIndex;
  QuestionChoice({
    required this.question,
    required this.answerIndex,
    Key? key,
  }) : super(key: key);

  final QuizController _quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    bool _isSelected() => _quizController.selectedAnswerIndex.toInt() == answerIndex;
    return Obx( () => GestureDetector(
      onTap: () => _quizController.setSelectedAnswerIndex(answerIndex),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isSelected() ? const Color(0xff5de094) : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.grey.shade300,
                blurRadius: 10)
          ],
        ),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: Row(
          children: [
            _isSelected()
                ? Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Color(0xff5de094),
                      size: 15,
                    ),
                  )
                : Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: const Color.fromARGB(255, 242, 242, 242),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                  ),
            const SizedBox(
              width: 15,
            ),
            Text(
              question,
              style: TextStyle(
                  color: _isSelected() ? Colors.white : Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ));
  }
}
