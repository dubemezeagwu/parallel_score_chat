import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parallel_score_chat/services/database.dart';
import 'package:parallel_score_chat/widgets/search_users_list_tile.dart';
import 'package:parallel_score_chat/widgets/widget_appbar.dart';

import '../../helpers/constants.dart';
import '../../helpers/outline_input_border.dart';

class SearchUsersScreen extends StatefulWidget {
  const SearchUsersScreen({Key? key}) : super(key: key);

  @override
  _SearchUsersScreenState createState() => _SearchUsersScreenState();
}

class _SearchUsersScreenState extends State<SearchUsersScreen> {

  TextEditingController searchUsernameTextEditingController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();
  QuerySnapshot? searchSnapshot ;


  /* Carries out a search by getting the instance value provided by the user
  *  and checking the Firestore for that instance and setting it to the searchSnapshot.
  */
  initiateSearch (){
    databaseService.getUserByUsername(searchUsernameTextEditingController.text).then((val){
          setState(() {
            searchSnapshot = val;
          });
    });
  }

  // Creates a chat room and starts a conversation in a conversation screen  
  createChatRoomAndStartConversation(String userName){
    List<String> users = [
      userName,
    ];
    databaseService.createChatRoom(chatRoomId, chatRoomMap)
  }

  Widget searchList (){
    return searchSnapshot != null ? ListView.builder(
      shrinkWrap: true,
        itemCount: searchSnapshot?.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return SearchTile(
              username: searchSnapshot?.docs[index]["username"],
              userEmail: searchSnapshot?.docs[index]["email"]);
        }) : Container();
  }

  // @override
  // void initState() {
  //   initiateSearch();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: defaultPadding, right: defaultPadding, top: 30.0),
            child: Form(
              child: TextFormField(
                controller: searchUsernameTextEditingController,
                decoration: InputDecoration(
                    hintText: "SEARCH USERNAME",
                    filled: true,
                    fillColor: formFieldBackgroundColor,
                    border: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    prefixIcon: Icon(Icons.search, size: 25,),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            initiateSearch();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          child: Icon(Icons.arrow_forward_rounded),
                        ),

                    )
                ),
              ),
            ),
          ),
          searchList()
        ],
      )
    );
  }
}
