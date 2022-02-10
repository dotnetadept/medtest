import 'package:medtest/entities/question_option.dart';

class Question {
  String text;
  double value;
  List<QuestionOption> options;

  Map toJson() => {'text': text, 'value': value, 'options': options};

  Question.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        value = json['value'],
        options = json['options'];
}
