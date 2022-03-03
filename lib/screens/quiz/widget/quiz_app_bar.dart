import 'package:flutter/material.dart';

class QuizAppBar extends StatelessWidget {
  const QuizAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.close,
              size: 27,
              color: Colors.black,
            ),
            Expanded(child: Container()),
            Row(
              children: const [
                Icon(
                  Icons.timer_outlined,
                  color: Colors.grey,
                ),
                SizedBox(width: 5,),
                Text(
                  '23 min remaining',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    // fontWeight: FontWeight.w500
                    ),
                )
              ],
            ),
            Expanded(child: Container()),
            const Text(
              'Quit Exam',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.blue
              ),
              )
          ]),
        ),
      ),
    );
  }
}
