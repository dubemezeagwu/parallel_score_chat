import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:parallel_score_chat/helpers/shared_preferences_helper.dart';
import 'package:parallel_score_chat/routes/auth/signup_page.dart';
import 'package:parallel_score_chat/routes/chat/chat_room_page.dart';
import 'package:parallel_score_chat/services/authentication.dart';
import 'package:parallel_score_chat/services/database.dart';
import 'package:parallel_score_chat/widgets/widget_appbar.dart';
import '../../helpers/constants.dart';
import '../../helpers/outline_input_border.dart';

class LoginPage extends StatefulWidget {
  final Function toggle;
  const LoginPage({Key? key, required this.toggle}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Login Page which contains the widgets and for this route.
class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  AuthenticationService authenticationService = AuthenticationService();
  DatabaseService databaseService = DatabaseService();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();

  bool isLoading = false;

  signIn (){
    if(formKey.currentState!.validate()){
      setState(() {
        isLoading = true;
      });

      databaseService.getUserByEmail(emailTextEditingController.text).then((){});

      authenticationService.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
          .then((value) {
            if(value != null){
              SharedPreferencesHelper.saveUserLoggedInSharedPreferences(true);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(
                  builder: (context) => ChatRoomPage(toggle: widget.toggle,)));
            }
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              LottieBuilder.asset(
                "assets/anim/chat-conversation-lottie.json",
                height: 200,
                width: 200,
                repeat: false,
              ),
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                          hintText: "EMAIL",
                          filled: true,
                          fillColor: formFieldBackgroundColor,
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: outlineInputBorder,
                        ),
                      ),
                      Divider(),
                      TextFormField(
                        obscureText: true,
                        controller: passwordTextEditingController,
                        decoration: InputDecoration(
                          hintText: "PASSWORD",
                          filled: true,
                          fillColor: formFieldBackgroundColor,
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: outlineInputBorder,
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text("Forgot Password"),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: const [
                        Color(0xff007ef4),
                        Color(0xff2a75bc)
                      ]),
                  borderRadius: BorderRadius.circular(defaultBorderRadius)
                ),
                child: GestureDetector(
                  onTap: (){},
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                        color: Colors.black12,
                    borderRadius: BorderRadius.circular(defaultBorderRadius)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    SvgPicture.asset("assets/icons/google-svgrepo-com.svg")
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text("Do not have an account? ", style: TextStyle(
                    fontSize: 14
                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                          builder: (context) => SignUpPage(toggle: widget.toggle,))
                      );
                    },
                    child: Text("Register Now", style: TextStyle(
                      fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
