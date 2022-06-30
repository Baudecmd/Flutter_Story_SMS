import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_tok/provider/global_provider.dart';
import 'package:story_tok/factory/user_action_item.dart';

class ActionListScreen extends StatefulWidget {
  ActionListScreen({Key? key}) : super(key: key);

  @override
  _ActionListScreenState createState() => _ActionListScreenState();
}

class _ActionListScreenState extends State<ActionListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, globalProvider, child) => Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: Icon(Icons.arrow_back),
          )),
          body: ListView.builder(
              itemCount: globalProvider.getListAction().length,
              itemBuilder: (context, index) =>
                  Container(child: UserActionItemFactory.createActionItem(globalProvider.getListAction()[index])))),
    );
  }
}
