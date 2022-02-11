import 'package:flutter/material.dart';
import 'package:medtest/pages/result_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  getNextButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getNextButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResultPage()));
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
