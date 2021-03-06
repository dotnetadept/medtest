class AppSettings {
  String windowTitle;

  String doctorName;
  String doctorSurname;
  String doctorLastname;
  String hospitalName;

  String patientName;
  String patientSurname;
  String patientLastname;
  int age;
  String diagnosis;
  String medCardId;

  double decisionValue;
  String positive;
  String negative;

  Map toJson() => {
        'windowTitle': windowTitle,
        'doctorName': doctorName,
        'doctorSurname': doctorSurname,
        'doctorLastname': doctorLastname,
        'hospitalName': hospitalName,
        'diagnosis': diagnosis,
        'decisionValue': decisionValue,
        'positive': positive,
        'negative': negative
      };

  AppSettings.fromJson(Map<String, dynamic> json)
      : windowTitle = json['windowTitle'],
        doctorName = json['doctorName'],
        doctorSurname = json['doctorSurname'],
        doctorLastname = json['doctorLastname'],
        hospitalName = json['hospitalName'],
        diagnosis = json['diagnosis'],
        decisionValue = json['decisionValue'],
        positive = json['positive'],
        negative = json['negative'];
}
