import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {

  /* Gets the username provided from the textField and asynchronously returns the
  *  value stored in that particular field in the Firestore database which matches
  *  the username the user has requested for.
  */
  getUserByUsername (String username) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("username", isEqualTo: username).get();
  }

  getUserByEmail (String email) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: email).get();
  }

  /* Sends the user information to the Firestore database,
  * by accepting a Map and passing that Map data to the collection.
  */
  uploadUserInfo (userMap){
    FirebaseFirestore.instance.collection("users")
        .add(userMap)
        .catchError((exception){
          print(exception);
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap){
    FirebaseFirestore.instance.collection("chatroom")
        .doc(chatRoomId).set(chatRoomMap).catchError((exception){
          print(exception);
    });
  }
}