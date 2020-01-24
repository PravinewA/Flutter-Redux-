import 'package:flutter/material.dart';
import 'package:learning_redux/models/cart_item.dart';
import 'package:learning_redux/redux/reducer.dart';
import 'package:learning_redux/shopping_cart.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main(){
  final store = new DevToolsStore<List<CartItem>>(cartItemReducer, initialState: new List());
  runApp(new ShoppingApp(store: store));
}

class ShoppingApp extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;

  const ShoppingApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: new Shopping_cart(store: store),
      ),
    );
  }
}
