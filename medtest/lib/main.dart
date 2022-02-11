import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medtest/entities/app_settings.dart';
import 'package:medtest/entities/question_column.dart';
import 'package:medtest/pages/init_page.dart';
import 'package:medtest/pages/result_page.dart';
import 'package:medtest/state/app_state.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setWindowTitle('Загрузка');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: 22,
          //   horizontal: 26,
          // ),
          labelStyle: TextStyle(
            fontSize: 20,
            //decorationColor: Colors.red,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            overlayColor: MaterialStateProperty.all(Colors.blueAccent),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    File('assets/cfg/app_settings.json').readAsString().then((value) {
      AppState.appSettings = AppSettings.fromJson(jsonDecode(value));

      File('assets/cfg/questions.json').readAsString().then((value) {
        AppState.questionColumns = (json.decode(value) as List)
            .map((data) => QuestionColumn.fromJson(data))
            .toList();

        setWindowTitle(AppState.appSettings.windowTitle);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InitPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
