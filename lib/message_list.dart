import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:provider/provider.dart';
import 'package:story_tok/provider/global_provider.dart';

import 'factory/conversation_action_item.dart';
import 'model/actions/user_action.dart';
import 'model/message.dart';
import 'model/user.dart';

class MessageList extends StatefulWidget {
  User user;
  MessageList({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: Provider.of<GlobalProvider>(context)
                .getListActionFromUser(widget.user)
                .length,
            reverse: true,
            itemBuilder: (context, index) => _buildItem(
                Provider.of<GlobalProvider>(context)
                    .getListActionFromUser(widget.user)
                    .toList()
                    .reversed
                    .toList()[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(UserAction userAction) {
    TextStyle textStyle = new TextStyle(fontSize: 20);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ConversationActionItem.createActionItem(userAction),
    );
  }
}
