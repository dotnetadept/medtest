class Decision {
  double minValue;
  double maxValue;
  String text;

  Decision.fromJson(Map<String, dynamic> json)
      : minValue = json['minValue'],
        maxValue = json['maxValue'],
        text = json['text'];
}
