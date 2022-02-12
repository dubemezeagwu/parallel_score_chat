import 'package:flutter/material.dart';
import 'package:parallel_score_chat/routes/auth/login_page.dart';
import 'package:parallel_score_chat/routes/auth/signup_page.dart';

class AuthenticateWidget extends StatefulWidget {
  const AuthenticateWidget({Key? key}) : super(key: key);

  @override
  _AuthenticateWidgetState createState() => _AuthenticateWidgetState();
}

class _AuthenticateWidgetState extends State<AuthenticateWidget> {
  bool showSignIn = false;

  /* This function toggles the view, and set the state
  * if the showSignIn boolean is true, it is negated here and sets to false
  * vice-versa.
  */
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return (showSignIn == true) ?
    LoginPage( toggle: toggleView,) : SignUpPage(toggle: toggleView,);
  }
}
