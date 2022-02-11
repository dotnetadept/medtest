class QuestionOption {
  String text;
  double value;
  bool isSelected = false;

  QuestionOption.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        value = json['value'];
}
