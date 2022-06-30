import 'package:flutter/material.dart';
import 'package:story_tok/model/actions/user_action.dart';
import 'package:story_tok/model/message.dart';
import 'package:story_tok/model/user.dart';
import '../model/global.dart';

class GlobalProvider extends ChangeNotifier {
  Global global = Global().initExample();

  void addUser(User user) {
    global.addUser(user);
    notifyListeners();
  }

  void addMessage(
      {required User user,
      required Message message,
      required bool isFromUser}) {
    global.addMessage(user: user, message: message, isFromUser: isFromUser);
    notifyListeners();
  }

  List<UserAction> getListActionFromUser(User user) {
    return global.listAction.where((element) => element.user == user).toList();
  }

  List<UserAction> getListAction() {
    return global.listAction;
  }
}
