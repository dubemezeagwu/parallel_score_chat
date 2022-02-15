import 'package:flutter/material.dart';
import 'package:parallel_score_chat/helpers/authenticate.dart';
import 'package:parallel_score_chat/routes/auth/login_page.dart';
import 'package:parallel_score_chat/routes/chat/search_users.dart';
import 'package:parallel_score_chat/services/authentication.dart';
import '../../helpers/constants.dart';
import '../../widgets/widget_reusable_card.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key, required this.toggle}) : super(key: key);
  final Function toggle;

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final AuthenticationService _authenticationService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Parallel Score Chat",
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              _authenticationService.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:(context) => LoginPage(toggle: widget.toggle) ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Icon(
                  Icons.exit_to_app,color: Colors.black,)),
          )
        ],
      ),
      body: Center(
        child: ReusableCard(
          child: Column(
            children: <Widget>[
              Text("developer.school"),
              Text("Jason")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => SearchUsersScreen())
          );
        },
      child: Icon(
          Icons.chat_outlined),
          backgroundColor: Colors.black,
      ),
    );
  }
}
