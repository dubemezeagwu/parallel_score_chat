import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:parallel_score_chat/widgets/widget_appbar.dart';
import '../../helpers/constants.dart';
import '../../helpers/outline_input_border.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Login Page which contains the widgets and for this route.
class _LoginPageState extends State<LoginPage> {
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
              TextFormField(
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
                decoration: InputDecoration(
                  hintText: "PASSWORD",
                  filled: true,
                  fillColor: formFieldBackgroundColor,
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                ),
              ),
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
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
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
                children: const [
                  Text("Do not have an account? ", style: TextStyle(
                    fontSize: 14
                  ),),
                  Text("Register Now", style: TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
