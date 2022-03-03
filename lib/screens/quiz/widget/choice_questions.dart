import 'package:flutter/material.dart';


class QuestionChoices extends StatefulWidget {
  const QuestionChoices({ Key? key }) : super(key: key);

  @override
  State<QuestionChoices> createState() => _QuestionChoicesState();
}

class _QuestionChoicesState extends State<QuestionChoices> {
  void _setSelectedAnswer = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 5,
        itemBuilder: ((context, index) => Container(
          width: MediaQuery.of(context).size.width,
          // height: 100,
          child: QuestionChoice(
            
          ),
        )),
    );
  }
}

class QuestionChoice extends StatelessWidget {
  const QuestionChoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff5de094),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Icon(
              Icons.check,
              color: Color(0xff5de094),
              size: 12,
              ),
          ),
          SizedBox(width: 15,),
          Text(
            'Answer',
            style: TextStyle(
              color: Colors.white
            ),
            )
        ],
      ),
    );
  }
}