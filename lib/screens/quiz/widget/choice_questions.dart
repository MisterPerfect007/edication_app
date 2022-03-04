import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  bool _needToScroll = false;
  _setNeedToScroll(scrollController) {
    if (!(scrollController.position.maxScrollExtent ==
            scrollController.offset) &&
        !_needToScroll) {
      setState(() {
        _needToScroll = true;
      });
    } else if ((scrollController.position.maxScrollExtent ==
            scrollController.offset) &&
        _needToScroll) {
      setState(() {
        _needToScroll = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _setNeedToScroll(_scrollController);
    });
    return Stack(
      children: [
        Scrollbar(
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              _setNeedToScroll(_scrollController);
              return true;
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              controller: _scrollController,
              itemBuilder: ((context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  // height: 100,
                  child: QuestionChoice(
                      selectedAnswerIndex: _selectedAnswerIndex,
                      answerIndex: index,
                      setSelectedAnswerIndex: _setSelectedAnswerIndex),
                );
              }),
            ),
          ),
        ),
        if (_needToScroll)
          Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width / 2) - 15,
            child: GestureDetector(
              onTap: () => _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut),
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 0))
                    ]),
                child: const Icon(
                  Icons.keyboard_double_arrow_down_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          )
      ],
    );
  }
}
