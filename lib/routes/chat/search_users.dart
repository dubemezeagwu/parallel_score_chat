import 'package:flutter/material.dart';
import 'package:parallel_score_chat/services/database.dart';
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
  final DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Padding(
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
                  child: GestureDetector(
                    onTap: (){},
                    child: ElevatedButton(
                      onPressed: () {
                        _databaseService.getUserByUsername(searchUsernameTextEditingController.text);
                      },
                      child: Icon(Icons.arrow_forward_rounded),
                    ),
                  ),
                )
            ),
          ),
        ),
      )
    );
  }
}
