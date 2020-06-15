import 'package:flutter/material.dart';

import 'UserListView_Content.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System User Corp."),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          UserListViewHeaderUI(),
          UserListViewContentUI(),
        ],
      ),
    );
  }
}