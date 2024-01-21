import 'package:flutter/material.dart';
import 'package:flutter_challenge_grocery_store_animation/model/grocery_product.dart';
import 'package:flutter_challenge_grocery_store_animation/model/grocery_state.dart';
import 'package:flutter_challenge_grocery_store_animation/provider/grocery_product_provider.dart';
import 'package:riverpod/riverpod.dart';


class GroceryStoreNotifier with ChangeNotifier{

  GroceryStoreNotifier(Ref ref){
    catalog = ref.read(groceryProductProvider);
  }

  List<GroceryProduct> catalog = [];
  List<GroceryProductItem> cart = [];


  void addProduct(GroceryProduct product){
    for (GroceryProductItem item in cart){
      if(item.product.name == product.name){
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  void deleteProduct(GroceryProductItem productItem){
    cart.remove(productItem);
    notifyListeners();
  }


  int totalCartElement(){
    return cart.fold<int>(0, (previousValue, element) => element.quantity + previousValue);
  }

  double totalPriceElement(){
    return cart.fold<double>(0, (previousValue, element) => (element.quantity * element.product.price) + previousValue);
  }
}

class GroceryProductItem{
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1, required this.product});

  void increment (){
    quantity++;
  }

  void decrement(){

  }
}