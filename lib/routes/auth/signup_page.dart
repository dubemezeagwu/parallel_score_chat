import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:parallel_score_chat/routes/chat/chat_room_page.dart';
import 'package:parallel_score_chat/services/authentication.dart';
import 'package:parallel_score_chat/services/database.dart';
import '../../helpers/constants.dart';
import '../../helpers/outline_input_border.dart';
import '../../widgets/widget_appbar.dart';
class SignUpPage extends StatefulWidget {
  final Function toggle;
  const SignUpPage({Key? key, required this.toggle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // Loading state of the signup page
  bool isLoading = false;

  // Key which validates the TextFormField inputs
  final formKey = GlobalKey<FormState>();

  AuthenticationService authenticationService = AuthenticationService();
  DatabaseService databaseService = DatabaseService();

  // Text-Editing controllers for input fields on registration
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController reEnterPasswordTextEditingController = TextEditingController();

  // If form-key is validated, it sets the state of the isLoading to true and
  // signs up the user with details provided.
  signUserUp(){
    if (formKey.currentState!.validate()){

      Map <String, String> userInfoMap = {
        "username" : userNameTextEditingController.text,
        "email" : emailTextEditingController.text
      };

      setState(() {
        isLoading = true;
      });
      authenticationService.signUpWithEmailAndPassword(emailTextEditingController.text, reEnterPasswordTextEditingController.text)
          .then((value){

            databaseService.uploadUserInfo(userInfoMap);
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ChatRoomPage() ));}
      );};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Center(
          child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              LottieBuilder.asset(
                "assets/anim/chat-conversation-lottie.json",
                height: 150,
                width: 200,
                repeat: false,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                  TextFormField(
                    validator: (value){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!) ? null : "Please provide a valid email";
                    },
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
                    validator: (value){
                      return value!.isEmpty || value.length< 4 ?
                      "Please enter a valid username" : null;
                    },
                    controller: userNameTextEditingController,
                    decoration: InputDecoration(
                      hintText: "USERNAME",
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
                    validator: (value){
                      return value!.length > 6 ?
                      null : "Please enter a valid password";
                    },
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                      hintText: "ENTER PASSWORD",
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
                    validator: (value){
                      return value!.length > 6 &&
                          passwordTextEditingController.text == reEnterPasswordTextEditingController.text ?
                      null : "Password does not match";
                    },
                    controller: reEnterPasswordTextEditingController,
                    decoration: InputDecoration(
                      hintText: "RE-ENTER PASSWORD",
                      filled: true,
                      fillColor: formFieldBackgroundColor,
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                    ),
                  ),
                ],),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: signUserUp,
                child: Container(
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
                    "Sign Up",
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
                      "Sign Up with Google",
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
                children: [
                  Text("Already have an account? ", style: TextStyle(
                      fontSize: 14
                  ),),
                  GestureDetector(
                    onTap: (){
                      widget.toggle;
                    },
                    child: Text("Sign In", style: TextStyle(
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
    );;
  }
}
