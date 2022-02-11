class AppSettings {
  String windowTitle;

  String doctorName;
  String doctorSurname;
  String doctorLastname;
  String hospitalName;
  String diagnosis;

  int questionColumnsCount;

  Map toJson() => {
        'windowTitle': windowTitle,
        'doctorName': doctorName,
        'doctorSurname': doctorSurname,
        'doctorLastname': doctorLastname,
        'hospitalName': hospitalName,
        'diagnosis': diagnosis,
        'questionColumnsCount': questionColumnsCount
      };

  AppSettings.fromJson(Map<String, dynamic> json)
      : windowTitle = json['windowTitle'],
        doctorName = json['doctorName'],
        doctorSurname = json['doctorSurname'],
        doctorLastname = json['doctorLastname'],
        hospitalName = json['hospitalName'],
        diagnosis = json['diagnosis'],
        questionColumnsCount = json['questionColumnsCount'];
}
