class AppSettings {
  String windowTitle;
  String diagnosis;
  int questionColumnsCount;

  Map toJson() => {
        'windowTitle': windowTitle,
        'diagnosis': diagnosis,
        'questionColumnsCount': questionColumnsCount
      };

  AppSettings.fromJson(Map<String, dynamic> json)
      : windowTitle = json['windowTitle'],
        diagnosis = json['diagnosis'],
        questionColumnsCount = json['questionColumnsCount'];
}
