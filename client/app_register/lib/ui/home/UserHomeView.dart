import 'package:app_register/ui/home/UserHomeView_Content.dart';
import 'package:flutter/material.dart';

class UserHomeView extends StatefulWidget {
  UserHomeView({Key key}) : super(key: key);

  @override
  _UserHomeViewState createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("System User Corp."),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView(
        children:<Widget>[
          UserHomeViewHeaderUI(),      
          UserHomeViewContentUI(),   
        ]
      ),

    );
  }
}