import 'package:flutter/material.dart';

import 'UserCreateView_Content.dart';

class UserCreateView extends StatelessWidget {
  const UserCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("System User Corp."),
        backgroundColor: Colors.black
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children:<Widget>[
          UserCreateViewHeaderUI(),
          UserCreateViewContentUI(),
        ]
      ),
    );
  }
}