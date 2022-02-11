import 'package:flutter/material.dart';
import 'package:medtest/pages/result_page.dart';
import 'package:medtest/pages/test_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  getDoctorInfo(),
                  getPatientInfo(),
                  getNextButton(),
                ],
              ),
            )
          ],
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
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Фамилия',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Отчество',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Лечебное учреждение',
                  ),
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
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Фамилия',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Отчество',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Возраст',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Диагноз',
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Номер медицинской карты',
                  ),
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
