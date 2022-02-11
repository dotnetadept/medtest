import 'package:flutter/material.dart';
import 'package:medtest/pages/test_page.dart';
import 'package:medtest/state/app_state.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _tecDoctorName =
      TextEditingController(text: AppState.appSettings.doctorName);
  TextEditingController _tecDoctorSurname =
      TextEditingController(text: AppState.appSettings.doctorSurname);
  TextEditingController _tecDoctorLastname =
      TextEditingController(text: AppState.appSettings.doctorLastname);
  TextEditingController _tecHospitalName =
      TextEditingController(text: AppState.appSettings.hospitalName);

  TextEditingController _tecPatientName = TextEditingController(text: '');
  TextEditingController _tecPatientSurname = TextEditingController(text: '');
  TextEditingController _tecPatientLastname = TextEditingController(text: '');
  TextEditingController _tecAge = TextEditingController(text: '');
  TextEditingController _tecDiagnosis =
      TextEditingController(text: AppState.appSettings.diagnosis);
  TextEditingController _tecMedCardId = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Row(
                children: [
                  Column(children: [
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getDoctorInfo(),
                        getPatientInfo(),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: getNextButton(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ]),
                ],
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDoctorInfo() {
    return Container(
      width: 450,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecDoctorName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecDoctorSurname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Фамилия',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecDoctorLastname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Отчество',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecHospitalName,
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Лечебное учреждение',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFFAFAFA),
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              'Врач',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget getPatientInfo() {
    return Container(
      width: 450,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecPatientName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecPatientSurname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Фамилия',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecPatientLastname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Отчество',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecAge,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Возраст',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Введите целое число';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecDiagnosis,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Диагноз',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: _tecMedCardId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Номер медицинской карты',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле не должно быть пустым';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFFAFAFA),
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              'Пациент',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget getNextButton() {
    return TextButton(
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }

        AppState.appSettings.doctorName = _tecDoctorName.text;
        AppState.appSettings.doctorSurname = _tecDoctorSurname.text;
        AppState.appSettings.doctorLastname = _tecDoctorLastname.text;
        AppState.appSettings.hospitalName = _tecHospitalName.text;

        AppState.appSettings.patientName = _tecPatientName.text;
        AppState.appSettings.patientSurname = _tecPatientSurname.text;
        AppState.appSettings.patientLastname = _tecPatientLastname.text;
        AppState.appSettings.age = int.parse(_tecAge.text);
        AppState.appSettings.diagnosis = _tecDiagnosis.text;
        AppState.appSettings.medCardId = _tecMedCardId.text;

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TestPage()));
      },
      child: Row(
        children: [
          Text(
            'Продолжить',
          ),
          Icon(Icons.arrow_right_alt),
        ],
      ),
    );
  }
}
