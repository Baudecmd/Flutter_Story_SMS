import 'package:story_tok/model/actions/user_action.dart';


class IsTypingAndCanceling extends UserAction{
  int typeDuration;
  IsTypingAndCanceling({required this.typeDuration,required user}):super(user: user);
}