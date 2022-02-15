import 'package:flutter/material.dart';
import 'package:parallel_score_chat/widgets/widget_reusable_card.dart';

class SearchTile extends StatelessWidget{
  final String username;
  final String userEmail;
  const SearchTile({
    Key? key,
    required this.username,
    required this.userEmail}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
        child: Row(
          children: [
            Column(
              children: [
                Text(username),
                Text(userEmail)
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){},
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () { },
                  child: Text("MESSAGE"),
                ),
              ),
            ),
          ],
        ),)
    );
  }

}