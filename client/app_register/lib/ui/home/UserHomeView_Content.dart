import 'package:app_register/ui/item/create/ItemCreateView.dart';
import 'package:app_register/ui/item/list/ItemListView.dart';
import 'package:app_register/ui/user/create/UserCreateView.dart';
import 'package:app_register/ui/user/list/UserListView.dart';
import 'package:flutter/material.dart';

class UserHomeViewHeaderUI extends StatelessWidget {
  const UserHomeViewHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to Systems User Corp".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ]),
    );
  }
}

class UserHomeViewContentUI extends StatefulWidget {

  UserHomeViewContentUI({Key key}) : super(key: key);

  @override
  _UserHomeViewContentUIState createState() =>
      _UserHomeViewContentUIState();
}

class _UserHomeViewContentUIState extends State<UserHomeViewContentUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, //expanded the width of the children widget
        children: <Widget>[
          RaisedButton(
              child: Text("Create User"),
               onPressed: () {
                //go to another route
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => UserCreateView())
                  );

          }),
          RaisedButton(
            child: Text("View User"), 
            onPressed: (){
              //go to another route
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => UserListView()
              ));
            }),
          RaisedButton(
            child: Text("Create Item"), 
            onPressed: (){
              //go to another route
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ItemCreateView()
              ));
            }),
            RaisedButton(
              child: Text("List Item"),
              onPressed: (){
                //go to another route
                Navigator.push(context, MaterialPageRoute(
                  builder: (content) => ItemListView()
                  ));
              }
              )
        ],
      ),
    );
  }
}
