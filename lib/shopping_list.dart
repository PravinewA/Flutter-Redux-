import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learning_redux/ShoppingItem.dart';
import 'package:learning_redux/models/cart_item.dart';

class shopping_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store)=> store.state,
      builder: (context,list)=>new ListView.builder(
        itemBuilder: (context, index)=> new ShoppingItem(item : list[index]),
        itemCount: list.length,
      ),
    );
  }
}
