import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:story_tok/component/is_typing.dart';
import 'package:story_tok/model/actions/add_message.dart';
import 'package:story_tok/model/actions/is_typing_and_canceling.dart';
import 'package:story_tok/model/actions/user_action.dart';

class ConversationActionItem {
  static Widget createActionItem(UserAction action) {
    switch (action.runtimeType) {
      case AddMesage:
        return _messageWidget(action as AddMesage);
      case IsTypingAndCanceling:
        return _isTypingAndCancelingWidget(action as IsTypingAndCanceling);
    }
    return Text("don't know what that is ");
  }

  static Widget _isTypingAndCancelingWidget(
      IsTypingAndCanceling isTypingAndCanceling) {
    return TypingIndicator(
      showIndicator: true,
    );
  }

  static Widget _messageWidget(AddMesage addMessage) {
    return addMessage.isFromUser
        ? ChatBubble(
            clipper: ChatBubbleClipper2(type: BubbleType.sendBubble),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 20),
            backGroundColor: Colors.blue,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              child: Text(
                addMessage.message.contenu,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        : ChatBubble(
            clipper: ChatBubbleClipper2(type: BubbleType.receiverBubble),
            backGroundColor: Color(0xffE7E7ED),
            margin: EdgeInsets.only(top: 20),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              child: Text(
                addMessage.message.contenu,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
