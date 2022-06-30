import 'package:flutter/material.dart';
import 'package:story_tok/model/actions/add_message.dart';
import 'package:story_tok/model/actions/is_typing_and_canceling.dart';
import 'package:story_tok/model/actions/user_action.dart';

class UserActionItemFactory {
  static Widget createActionItem(UserAction action) {
    switch (action.runtimeType) {
      case AddMesage:
        return Text("Addmessage");
      case IsTypingAndCanceling:
        return Text("IsTypingCanceling");
    }
    return Text("don't know what that is ");
  }
}
