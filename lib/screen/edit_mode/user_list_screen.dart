import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_tok/provider/global_provider.dart';
import 'package:story_tok/component/item_user_list.dart';
import 'package:story_tok/model/user.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, globalProvider, child) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Text("Messages",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: globalProvider.global.listUser.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemUserlist(
                            user: globalProvider.global.listUser[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
