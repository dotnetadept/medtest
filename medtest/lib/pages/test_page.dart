import 'package:flutter/material.dart';
import 'package:medtest/entities/question.dart';
import 'package:medtest/entities/question_option.dart';
import 'package:medtest/pages/result_page.dart';
import 'package:medtest/state/app_state.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> questonColumns = <Widget>[];

    for (int i = 0; i < AppState.questionColumns.length; i++) {
      List<Widget> _questions = <Widget>[];
      for (int j = 0; j < AppState.questionColumns.length; j++) {
        _questions
            .add(getQuestionWidget(AppState.questionColumns[i].questions[j]));
        _questions.add(Expanded(child: Container()));
      }

      if (i == AppState.questionColumns.length - 1) {
        _questions.add(Row(children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 45),
            child: getNextButton(),
          ),
        ]));
      }

      questonColumns.add(
        Expanded(
          child: Column(children: _questions),
        ),
      );
    }

    Row view = new Row(children: questonColumns);

    return Scaffold(
      body: Center(
        child: view,
      ),
    );
  }

  Widget getQuestionWidget(Question question) {
    List<Widget> questionOptions = <Widget>[];

    for (int i = 0; i < question.options.length; i++) {
      questionOptions.add(
        getQuestionOption(question, question.options[i]),
      );
    }

    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  question.text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Container(
            height: 5,
          ),
          Row(
            children: questionOptions,
          )
        ],
      ),
    );
  }

  Widget getQuestionOption(Question question, QuestionOption option) {
    return Row(
      children: [
        Checkbox(
          value: option.isSelected,
          onChanged: (bool value) {
            setState(() {
              question.options.forEach((element) {
                if (element != option) {
                  element.isSelected = false;
                }
              });
              option.isSelected = value;
            });
          },
        ),
        Text(option.text),
        Container(
          width: 10,
        ),
      ],
    );
  }

  Widget getNextButton() {
    return TextButton(
      onPressed: () {
        for (int i = 0; i < AppState.questionColumns.length; i++) {
          for (int j = 0; j < AppState.questionColumns.length; j++) {
            if (!AppState.questionColumns[i].questions[j].options
                .any((element) => element.isSelected)) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Признак ${AppState.questionColumns[i].questions[j].text} не отмечен."),
                  duration: Duration(seconds: 10),
                ),
              );

              return;
            }
          }
        }

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
