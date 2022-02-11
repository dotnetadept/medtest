import 'package:medtest/entities/question_option.dart';

class Question {
  String text;
  List<QuestionOption> options;

  Question.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        options = json['options']
            .map<QuestionOption>((q) => QuestionOption.fromJson(q))
            .toList();
}
