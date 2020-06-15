import 'package:app_register/models/api/user/list/UserResponse.dart';
import 'package:app_register/repository/UserRepository.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class UserListViewHeaderUI extends StatelessWidget {
  const UserListViewHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "View All Users".toUpperCase(),
            ),
          ]),
    );
  }
}


class UserListViewContentUI extends StatefulWidget {
  UserListViewContentUI({Key key}) : super(key: key);

  @override
  _UserListViewContentUIState createState() => _UserListViewContentUIState();
}

class _UserListViewContentUIState extends State<UserListViewContentUI> {
  
  Future<GetAllUserResponse> users;

  @override
  void initState() {
    super.initState();
        users = UserRepository.getAllUser();

  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
          child: FutureBuilder(
            future: users,
            builder: (context,AsyncSnapshot<GetAllUserResponse> snapshot){
              if(snapshot.hasData){
                return createListView(snapshot.data.data,context);
              }else{
                return CircularProgressIndicator();
              }
            }),
        );
  }

Widget createListView(List<UserInfo> data,BuildContext context){
  return Container(
    child: ListView.builder(
         shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context,int index){
        return Column(
          children: <Widget>[
            Divider(height: 5.0,),
            ListTile(
              title:(Text("${data[index].name}")),
              subtitle: Text("User information"),
              leading: Column(
                children: <Widget>[
                  CircleAvatar(
                  backgroundColor:Colors.amber,
                  radius:23,
                  child:Text("${data[index].no}")
                )
                ],
              ),
            ),
          ],
          );
      }),
  );
}

  
}