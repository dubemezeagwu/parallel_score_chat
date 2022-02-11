import 'package:flutter/material.dart';
import 'package:parallel_score_chat/helpers/constants.dart';

AppBar appBarMain (BuildContext context, ){
  return AppBar(
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
  );
}