import 'package:flutter/material.dart';
import 'package:parallel_score_chat/routes/auth/login_page.dart';
import 'package:parallel_score_chat/routes/auth/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallel Score Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: SignUpPage(),
    );
  }
}

