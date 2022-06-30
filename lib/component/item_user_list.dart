import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_tok/provider/global_provider.dart';
import 'package:story_tok/model/user.dart';
import 'package:story_tok/screen/edit_mode/conversation_screen.dart';

class ItemUserlist extends StatelessWidget {
  final User user;
  const ItemUserlist({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, globalProvider, child) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ConversationScreen(
                    user: user,
                  )));
        },
        child: Row(
          children: [
            Container(
              width: 75,
              height: 75,
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?size=626&ext=jpg&ga=GA1.2.1517404616.1625788800'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.firstName,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
