import 'package:medtest/entities/question.dart';

class QuestionColumn {
  List<Question> questions;

  QuestionColumn.fromJson(Map<String, dynamic> json)
      : questions = json['questions']
            .map<Question>((q) => Question.fromJson(q))
            .toList();
}
