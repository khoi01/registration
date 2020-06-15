import 'package:app_register/models/db/item/item.dart';
import 'package:app_register/repository/ItemRepository.dart';
import 'package:flutter/material.dart';

class ItemCreateViewHeaderUI extends StatelessWidget {
  const ItemCreateViewHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            "Create Item".toUpperCase(),
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


class ItemCreateViewContentUI extends StatefulWidget {
  ItemCreateViewContentUI({Key key}) : super(key: key);

  @override
  _ItemCreateViewContentUIState createState() => _ItemCreateViewContentUIState();
}

class _ItemCreateViewContentUIState extends State<ItemCreateViewContentUI> {

    final _itemController = TextEditingController();
  
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
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
                    controller: _itemController,
                    style: TextStyle(
                      color:Colors.black,
                    ),
                    decoration: InputDecoration(labelText: "Enter Item")
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Text("Submit"),
                    onPressed: (){

                     //send data to server 
                      showProgress = true;

                      var item = new Item(name: _itemController.text);
                      _save(item);

                    
                    }),
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

  void _save(Item item) async{

      dynamic result = await ItemRepository.insert(Item.table,item);
    	print("result:"+result.toString());

      setState(() {
    	  showProgress = false;
        _itemController.text = "";
    	});

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
