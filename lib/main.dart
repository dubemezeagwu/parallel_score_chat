import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parallel_score_chat/helpers/authenticate.dart';
import 'package:parallel_score_chat/routes/auth/login_page.dart';
import 'package:parallel_score_chat/routes/auth/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

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
      home: AuthenticateWidget(),
    );
  }
}

