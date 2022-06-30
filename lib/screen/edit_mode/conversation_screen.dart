import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:provider/provider.dart';
import 'package:story_tok/message_list.dart';
import 'package:story_tok/provider/global_provider.dart';
import 'package:story_tok/model/actions/add_message.dart';
import 'package:story_tok/model/message.dart';
import 'package:story_tok/model/user.dart';
import 'package:story_tok/screen/edit_mode/action_list.dart';
import 'package:story_tok/screen/edit_mode/user_list_screen.dart';

class ConversationScreen extends StatefulWidget {
  final User user;

  ConversationScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, globalProvider, child) => Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () => {
                      Navigator.pop(context)
                    },
                child: Icon(Icons.arrow_back)),
            actions: [ GestureDetector(
                onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActionListScreen()))
                    },
                child: Icon(Icons.format_list_bulleted))],
            title: Text(
              widget.user.firstName,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            )),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: MessageList(user: widget.user))),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        onPressed: () {
                          globalProvider.addMessage(
                              user: widget.user,
                              message: new Message(contenu: _controller.text),
                              isFromUser: false);
                          _controller.clear();
                        },
                        child: Text("💬", style: TextStyle(fontSize: 35))),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Entrer le message ici'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        globalProvider.addMessage(
                            user: widget.user,
                            message: new Message(contenu: _controller.text),
                            isFromUser: true);
                        _controller.clear();
                      },
                      child: Text("💬", style: TextStyle(fontSize: 35)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: globalProvider.getListAction().length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConversationScreen(
                                      user: globalProvider
                                          .getListAction()
                                          .reversed
                                          .toList()
                                          .asMap()[index]!
                                          .user)));
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 106, 255, 1),
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text((index + 1).toString(),
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
