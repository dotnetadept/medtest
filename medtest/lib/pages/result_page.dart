import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medtest/state/app_state.dart';
import 'package:intl/intl.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double _sum = 0.0;
  List<Widget> _riskFactors = <Widget>[];
  List<String> _riskFactorsText = <String>[];

  void initState() {
    super.initState();

    for (int i = 0; i < AppState.questionColumns.length; i++) {
      for (int j = 0; j < AppState.questionColumns.length; j++) {
        var selectedOption = AppState.questionColumns[i].questions[j].options
            .firstWhere((element) => element.isSelected == true);

        if (selectedOption.value > double.minPositive) {
          _sum += selectedOption.value;
          String message = AppState.questionColumns[i].questions[j].text +
              ' ПК+' +
              selectedOption.value.toString();
          _riskFactorsText.add(message);
          _riskFactors.add(
            Row(children: [
              Text(
                message,
                style: TextStyle(fontSize: 16),
              )
            ]),
          );
          _riskFactors.add(Container(
            height: 5,
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ФИО Пациента',
                ),
                controller: TextEditingController(
                    text: AppState.appSettings.patientSurname +
                        ' ' +
                        AppState.appSettings.patientName +
                        ' ' +
                        AppState.appSettings.patientLastname),
                readOnly: true,
              ),
              Container(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Диагноз',
                ),
                controller: TextEditingController(
                    text: AppState.appSettings.patientName),
                readOnly: true,
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Возраст',
                      ),
                      controller: TextEditingController(
                          text: AppState.appSettings.patientName),
                      readOnly: true,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Номер медицинской карты',
                      ),
                      controller: TextEditingController(
                          text: AppState.appSettings.patientName),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Row(children: [
                Text(
                  'Факторы риска:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ]),
              Container(
                height: 5,
              ),
              Container(
                color: Colors.grey.withOpacity(0.5),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _riskFactors,
                ),
              ),
              Container(
                height: 10,
              ),
              Row(children: [
                Text(
                  'Сумма ПК+' +
                      _sum.toStringAsFixed(2) +
                      ' (порог ПК+' +
                      AppState.appSettings.decisionValue.toString() +
                      '):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ]),
              Container(
                height: 5,
              ),
              Row(children: [
                Text(
                  _sum >= AppState.appSettings.decisionValue
                      ? AppState.appSettings.negative
                      : AppState.appSettings.positive,
                  style: TextStyle(
                      fontSize: 24,
                      color: _sum >= AppState.appSettings.decisionValue
                          ? Colors.red
                          : Colors.green),
                ),
              ]),
              Container(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ФИО врача',
                ),
                controller: TextEditingController(
                    text: AppState.appSettings.patientName),
                readOnly: true,
              ),
              Container(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Лечебное учреждение',
                ),
                controller: TextEditingController(
                    text: AppState.appSettings.patientName),
                readOnly: true,
              ),
              Container(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  getBackButton(),
                  Container(
                    width: 30,
                  ),
                  getSaveButton(),
                  Container(
                    width: 30,
                  ),
                  getExitButton(),
                  Expanded(
                    child: Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getBackButton() {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Text(
            'Назад',
          ),
          Container(
            width: 5,
          ),
          Icon(Icons.arrow_back),
        ],
      ),
    );
  }

  Widget getSaveButton() {
    return TextButton(
      onPressed: () {
        String report = '';
        String reportFolder = 'reports/';
        String fileName = AppState.appSettings.patientSurname +
            AppState.appSettings.patientName +
            AppState.appSettings.patientLastname +
            '_' +
            DateFormat('ddMMyyyy').format(DateTime.now()) +
            '.doc';

        report += 'ФИО Пациента: ' +
            AppState.appSettings.patientSurname +
            ' ' +
            AppState.appSettings.patientName +
            ' ' +
            AppState.appSettings.patientLastname +
            '\r\n';
        report += '\r\n';

        report += 'Диагноз: ' + AppState.appSettings.diagnosis + '\r\n';
        report += 'Возраст: ' + AppState.appSettings.age.toString() + '\r\n';
        report += 'Номер медицинской карты: ' +
            AppState.appSettings.medCardId +
            '\r\n';
        report += '\r\n';

        report += 'Факторы риска: \r\n';

        for (int i = 0; i < _riskFactorsText.length; i++) {
          report += '\t' + _riskFactorsText[i] + '\r\n';
        }

        report += '\r\n';
        report += 'ФИО Врача: ' +
            AppState.appSettings.doctorSurname +
            ' ' +
            AppState.appSettings.doctorName +
            ' ' +
            AppState.appSettings.doctorLastname +
            '\r\n';
        report += 'Лечебное учреждение: ' +
            AppState.appSettings.hospitalName +
            '\r\n';
        report += 'от: ' + DateFormat('HH:mm').format(DateTime.now()) + '\r\n';

        File(reportFolder + fileName).create(recursive: true).then((e) {
          File(reportFolder + fileName).writeAsString(report).then((value) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Файл $fileName сохранен"),
                duration: Duration(seconds: 10),
              ),
            );
          });
        });
      },
      child: Row(
        children: [
          Text(
            'Сохранить',
          ),
          Container(
            width: 5,
          ),
          Icon(Icons.save),
        ],
      ),
    );
  }

  Widget getExitButton() {
    return TextButton(
      onPressed: () {
        SystemNavigator.pop();
      },
      child: Row(
        children: [
          Text(
            'Выход',
          ),
          Container(
            width: 5,
          ),
          Icon(Icons.exit_to_app),
        ],
      ),
    );
  }
}
