import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:learning_redux/models/cart_item.dart';
import 'package:learning_redux/shopping_list.dart';
import 'package:learning_redux/add_item_dialog.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class Shopping_cart extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;

  const Shopping_cart({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping Cart"),
      ),
      body: new shopping_list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: ()=>_openAddItemDialog(context),
          child: new Icon(Icons.add),
      ),
      endDrawer: new ReduxDevTools(store),
    );
  }
}

_openAddItemDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (context)=> new AddItemDialog()
  );
}
