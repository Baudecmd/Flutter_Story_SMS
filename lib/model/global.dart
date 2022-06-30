import 'package:story_tok/model/actions/add_message.dart';
import 'package:story_tok/model/actions/is_typing_and_canceling.dart';
import 'package:story_tok/model/message.dart';

import 'actions/user_action.dart';
import 'user.dart';

class Global {
  List<UserAction> listAction = [].cast<UserAction>().toList();
  List<User> listUser = [].cast<User>().toList();

  Global();

  addUser(User user) {
    listUser.add(user);
  }

  Global initExample() {
    Global global = new Global();
    User user = new User(firstName: "Conrad", lastName: "BAUDELET");
    global.listUser = [
      user,
      new User(firstName: "Julie", lastName: "BODA"),
      new User(firstName: "Julie", lastName: "BODA"),
      new User(firstName: "Vincent", lastName: "Dupont"),
      new User(firstName: "Thierry", lastName: "Dupont")
    ].toList();

    global.listAction.add(new AddMesage(
        message: new Message(contenu: "hello"), user: user, isFromUser: false));
    global.listAction.add(new AddMesage(
        message: new Message(contenu: "hello2"), user: user, isFromUser: true));
    global.listAction
        .add(new IsTypingAndCanceling(typeDuration: 2, user: user));
    return global;
  }

  List<AddMesage> getMessageFromUser(User user) {
    List<AddMesage> listActionLoc = [];

    for (UserAction item in this.listAction) {
      if (item is AddMesage) {
        if (item.user == user) listActionLoc.add(item);
      }
    }

    return listActionLoc;
  }

  @override
  String toString() {
    for (User user in listUser) {
      print(user);
    }

    return "Fin fin";
  }

  void addMessage(
      {required User user,
      required Message message,
      required bool isFromUser}) {
    listAction.insert(
        0, new AddMesage(message: message, user: user, isFromUser: isFromUser));
  }
}
