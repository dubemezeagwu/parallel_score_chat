import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  getUserByUsername (String username) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("username", isEqualTo: username).get();
  }
  uploadUserInfo (userMap){
    FirebaseFirestore.instance.collection("users")
        .add(userMap)
        .catchError((exception){
          print(exception);
    });
  }
}