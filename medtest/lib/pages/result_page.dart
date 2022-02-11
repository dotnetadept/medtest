import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  getBackButton(),
                ],
              ),
            )
          ],
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
          Icon(Icons.arrow_back),
        ],
      ),
    );
  }
}
