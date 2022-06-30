import 'package:story_tok/model/actions/user_action.dart';
import 'package:story_tok/model/message.dart';

import '../user.dart';

class AddMesage extends UserAction{
  Message message;
  bool isFromUser;
  AddMesage({required this.message,required User user,required this.isFromUser}):super(user: user);
}