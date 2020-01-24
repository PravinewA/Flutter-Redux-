import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learning_redux/models/cart_item.dart';
import 'package:learning_redux/redux/action.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String itemName;
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemAddedCallback>(
      converter: (store)=>(itemName)=>store.dispatch(AddItemAction(CartItem(name: itemName, checked: false))),
      builder: (context, callback)=>new AlertDialog(
        title: new Text("Add Item"),
        contentPadding: const EdgeInsets.all(18.0),
        content: new Row(
          children: <Widget>[
            new Expanded(child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: "Item Name",
                  hintText: "Eg. : iphone X"
              ),
              onChanged: (value){
                setState(() {
                  itemName = value;
                });
              },
            ))],
        ),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: new Text("Cancel")),
          new FlatButton(
              onPressed: (){
                callback(itemName);
                Navigator.of(context).pop();
              },
              child: new Text("Add"))
        ],
      ),
    );
  }
}

typedef OnItemAddedCallback = Function(String ItemName);