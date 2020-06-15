import 'package:app_register/ui/item/list/ItemListView_Content.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("System Corp."),
        backgroundColor: Colors.black
      ) ,
      backgroundColor: Colors.white,
      body: ListView(
        children:<Widget>[
          ItemListViewHeaderUI(),
          ItemListViewContentUI()
        ]
      ),
    );
  }
}