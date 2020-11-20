import 'package:app_register/models/db/item/item.dart';
import 'package:app_register/repository/ItemRepository.dart';
import 'package:flutter/material.dart';

class ItemListViewHeaderUI extends StatelessWidget {
  const ItemListViewHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            "List Item".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ItemListViewContentUI extends StatefulWidget {
  ItemListViewContentUI({Key key}) : super(key: key);

  @override
  _ItemListViewContentUIState createState() => _ItemListViewContentUIState();
}

class _ItemListViewContentUIState extends State<ItemListViewContentUI> {
  List<Item> _list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(_list);
    return Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _list.length,
            itemBuilder: (context, int index) {
              return Column(
                children: <Widget>[
                  Divider(
                    height: 5.0,
                  ),
                  ListTile(
                    title: (Text("${_list[index].name}")),
                    subtitle: Text("User information"),
                    leading: Column(
                      children: <Widget>[
                        CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 23,
                            child: Text("${_list[index].id}"))
                      ],
                    ),
                  ),
                ],
              );
            }));
  }

  void getData() async {
    List<Map<String, dynamic>> _results =
        await ItemRepository.query(Item.table);
    _list = _results.map((item) => Item.fromMap(item)).toList();
    refresh();
  }

  void refresh() {
    setState(() {});
  }
}
