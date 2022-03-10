class QuizQuestionsModel {
  late String id;
  late int time;
  late String question;
  late int answerIndex;
  late List choices;

  QuizQuestionsModel(
    this.id,
    this.time,
    this.question,
    this.answerIndex,
    this.choices
  );

  QuizQuestionsModel.fromJSON( jsonData ) {
    id = jsonData["id"];
    time = jsonData["time"];
    question = jsonData["question"];
    answerIndex = jsonData["answer_index"];
    choices = jsonData["choices"];
  }
}