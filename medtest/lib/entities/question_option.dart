class QuestionOption {
  String text;
  double value;
  bool isSelected;

  Map toJson() => {'text': text, 'value': value};

  QuestionOption.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        value = json['value'];
}
