class QuestionOption {
  String text;
  double value;
  bool isSelected;

  QuestionOption.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        value = json['value'];
}
