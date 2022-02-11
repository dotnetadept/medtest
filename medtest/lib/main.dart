import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:medtest/entities/app_settings.dart';
import 'package:medtest/entities/decision.dart';
import 'package:medtest/entities/question.dart';
import 'package:medtest/pages/init_page.dart';
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            overlayColor: MaterialStateProperty.all(Colors.blueAccent),
          ),
        ),
      ),
      home: const HomePage(),
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
    // TODO: implement initState
    super.initState();

    File('assets/cfg/app_settings.json').readAsString().then((value) {
      AppState.appSettings = AppSettings.fromJson(jsonDecode(value));

      File('assets/cfg/questions.json').readAsString().then((value) {
        AppState.questions = (json.decode(value) as List)
            .map((data) => Question.fromJson(data))
            .toList();

        File('assets/cfg/decisions.json').readAsString().then((value) {
          AppState.decisions = (json.decode(value) as List)
              .map((data) => Decision.fromJson(data))
              .toList();

          setWindowTitle(AppState.appSettings.windowTitle);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InitPage()));
        });
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
