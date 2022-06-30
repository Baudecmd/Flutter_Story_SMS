import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_tok/provider/global_provider.dart';

import 'package:story_tok/screen/edit_mode/user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalProvider>(
      create: (context) => GlobalProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.black,
            primaryColor: Colors.white),
        home: UserListScreen(),
      ),
    );
  }
}
