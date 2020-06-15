import 'package:app_register/models/api/Response.dart';
import 'package:app_register/models/data/user/create/UserPost.dart';
import 'package:app_register/repository/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserCreateViewHeaderUI extends StatelessWidget {
  const UserCreateViewHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            "Create User".toUpperCase(),
             style: TextStyle(
               color:Colors.white
               ) 
               ,
            ),
        ),
        ),
    );
  }
}


class UserCreateViewContentUI extends StatefulWidget {
  UserCreateViewContentUI({Key key}) : super(key: key);

  @override
  _UserCreateViewContentUIState createState() => _UserCreateViewContentUIState();
}

class _UserCreateViewContentUIState extends State<UserCreateViewContentUI> {
  
  final _nameController = TextEditingController();
  
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {

    Future<Response> response;
    return Container(
     padding: const EdgeInsets.all(10),
     child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    controller: _nameController,
                    style: TextStyle(
                      color:Colors.black,
                    ),
                    decoration: InputDecoration(labelText: "Enter User")
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Text("Submit"),
                    onPressed: () => setState((){

                     //send data to server 
                      showProgress = true;

                      var user = new UserPost(_nameController.text);

                     UserRepository.sendDataToServer(user.toMap()).then((response) => 
                          ShowSnackBar(response.message,context)
                     );
                     
                    }),
                    )
                ),
                Flexible(
                  child: showProgress ? CircularProgressIndicator(): Text(""),
                ),

              ],
            )
          ],
     ),
    );
  }


    void ShowSnackBar(String message,BuildContext context){

        setState(() {
           showProgress = false;
        });

        final snackBar = SnackBar(content: Text(message));

    // Find the Scaffold in the widget tree and use it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }
 }

 








