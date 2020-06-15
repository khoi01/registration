import 'package:app_register/ui/item/create/ItemCreateView_Content.dart';
import 'package:flutter/material.dart';

class ItemCreateView extends StatelessWidget {
  const ItemCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("System Corp."),
        backgroundColor: Colors.black
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children:<Widget>[
          ItemCreateViewHeaderUI(),
          ItemCreateViewContentUI(),
        ]
      ),
    );
  }
}